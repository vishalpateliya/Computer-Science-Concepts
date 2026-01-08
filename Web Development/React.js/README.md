# React.js Interview Preparation Guide

## 📑 Table of Contents

### [1. React Core Concepts](#1-react-core-concepts)
- [JSX](#jsx)
- [Components](#components)
- [Props](#props)
- [State](#state)
- [Lifecycle Methods](#lifecycle-methods)
- [Event Handling](#event-handling)
- [Conditional Rendering](#conditional-rendering)
- [Lists and Keys](#lists-and-keys)

### [2. React Hooks](#2-react-hooks)
- [useState](#usestate)
- [useEffect](#useeffect)
- [useContext](#usecontext)
- [useReducer](#usereducer)
- [useCallback](#usecallback)
- [useMemo](#usememo)
- [useRef](#useref)
- [Custom Hooks](#custom-hooks)

### [3. Advanced React Concepts](#3-advanced-react-concepts)
- [Higher-Order Components (HOC)](#higher-order-components-hoc)
- [Render Props](#render-props)
- [Error Boundaries](#error-boundaries)
- [Code Splitting & Lazy Loading](#code-splitting--lazy-loading)
- [Portals](#portals)
- [Suspense](#suspense)

### [4. Performance Optimization](#4-performance-optimization)
- [React.memo](#reactmemo)
- [useMemo vs useCallback](#usememo-vs-usecallback)
- [Virtual DOM](#virtual-dom)
- [Key Prop Best Practices](#key-prop-best-practices)

### [5. State Management](#5-state-management)
- [Context API](#context-api)
- [Redux Basics](#redux-basics)

### [6. React Ecosystem & Tools](#6-react-ecosystem--tools)
- [React Router](#react-router)
- [Form Handling](#form-handling)
- [Testing React Components](#testing-react-components)

### [7. Common Interview Questions](#7-common-interview-questions)

---

## 1. React Core Concepts

### JSX

**What is JSX?**
JSX is a syntax extension to JavaScript that allows you to write HTML-like code in JavaScript. It compiles to `React.createElement()` calls.

**Example:**
```javascript
// JSX
const element = <h1>Hello, {name}!</h1>;

// Compiles to:
const element = React.createElement('h1', null, `Hello, ${name}!`);
```

**Key Points:**
- JSX is not valid JavaScript; it needs to be transpiled
- JSX elements must have a single root element
- Use `{}` to embed JavaScript expressions
- Use `className` instead of `class` (reserved keyword)

---

### Components

**What are Components?**
Components are reusable, self-contained pieces of UI. There are two types: Functional and Class components.

**Functional Component:**
```javascript
function Welcome(props) {
  return <h1>Hello, {props.name}</h1>;
}

// Or as an arrow function
const Welcome = (props) => {
  return <h1>Hello, {props.name}</h1>;
};
```

**Class Component:**
```javascript
class Welcome extends React.Component {
  render() {
    return <h1>Hello, {this.props.name}</h1>;
  }
}
```

**Key Differences:**
- Functional components are simpler and recommended in modern React
- Class components have access to lifecycle methods
- Hooks bring lifecycle-like features to functional components

---

### Props

**What are Props?**
Props are arguments passed into React components, like function parameters. They are read-only and help make components reusable.

**Example:**
```javascript
// Parent Component
function App() {
  return <Greeting name="John" age={25} />;
}

// Child Component
function Greeting({ name, age }) {
  return <p>{name} is {age} years old</p>;
}
```

**Default Props:**
```javascript
function Greeting({ name = "Guest" }) {
  return <h1>Welcome, {name}!</h1>;
}
```

**Props Validation (PropTypes):**
```javascript
import PropTypes from 'prop-types';

function Greeting({ name, age }) {
  return <div>{name}, {age}</div>;
}

Greeting.propTypes = {
  name: PropTypes.string.isRequired,
  age: PropTypes.number
};
```

---

### State

**What is State?**
State is a JavaScript object that holds data that influences the output of a component. Unlike props, state is managed within the component and can be changed.

**Functional Component (using useState):**
```javascript
import { useState } from 'react';

function Counter() {
  const [count, setCount] = useState(0);

  return (
    <div>
      <p>Count: {count}</p>
      <button onClick={() => setCount(count + 1)}>
        Increment
      </button>
    </div>
  );
}
```

**Class Component:**
```javascript
class Counter extends React.Component {
  constructor(props) {
    super(props);
    this.state = { count: 0 };
  }

  render() {
    return (
      <div>
        <p>Count: {this.state.count}</p>
        <button onClick={() => this.setState({ count: this.state.count + 1 })}>
          Increment
        </button>
      </div>
    );
  }
}
```

---

### Lifecycle Methods

**What are Lifecycle Methods?**
Lifecycle methods are special methods in class components that run at specific times during the component's life.

**Main Lifecycle Phases:**
1. **Mounting** - when instance is created and inserted into DOM
2. **Updating** - when component is being re-rendered
3. **Unmounting** - when component is removed from DOM

**Common Methods:**
```javascript
class MyComponent extends React.Component {
  componentDidMount() {
    // Called after component mounts
    // Good place for API calls
    console.log('Component mounted');
  }

  componentDidUpdate(prevProps, prevState) {
    // Called after component updates
    if (prevProps.id !== this.props.id) {
      // Fetch new data when id changes
    }
  }

  componentWillUnmount() {
    // Called before component unmounts
    // Good place for cleanup (cancel API calls, remove listeners)
    console.log('Component will unmount');
  }

  render() {
    return <div>Lifecycle Component</div>;
  }
}
```

---

### Event Handling

**What is Event Handling?**
Event handling in React is similar to handling events in DOM, but with some differences in syntax.

**Example:**
```javascript
function ButtonClick() {
  const handleClick = () => {
    alert('Button clicked!');
  };

  return <button onClick={handleClick}>Click Me</button>;
}
```

**Passing Arguments:**
```javascript
function UserList() {
  const handleDelete = (id) => {
    console.log(`Delete user ${id}`);
  };

  return (
    <button onClick={() => handleDelete(1)}>
      Delete User 1
    </button>
  );
}
```

**Accessing Event Object:**
```javascript
function FormInput() {
  const handleChange = (e) => {
    console.log('Input value:', e.target.value);
  };

  return <input onChange={handleChange} />;
}
```

---

### Conditional Rendering

**What is Conditional Rendering?**
It's rendering different UI based on certain conditions.

**Method 1: If/Else:**
```javascript
function LoginPage({ isLoggedIn }) {
  if (isLoggedIn) {
    return <div>Welcome back!</div>;
  } else {
    return <div>Please log in</div>;
  }
}
```

**Method 2: Ternary Operator:**
```javascript
function LoginPage({ isLoggedIn }) {
  return isLoggedIn ? <div>Welcome!</div> : <div>Please log in</div>;
}
```

**Method 3: Logical && Operator:**
```javascript
function Notifications({ unreadCount }) {
  return (
    <div>
      {unreadCount > 0 && <p>You have {unreadCount} unread messages</p>}
    </div>
  );
}
```

---

### Lists and Keys

**What are Lists and Keys?**
Lists are used to render multiple elements. Keys help React identify which items have changed.

**Example:**
```javascript
function UserList({ users }) {
  return (
    <ul>
      {users.map((user) => (
        <li key={user.id}>{user.name}</li>
      ))}
    </ul>
  );
}
```

**Why Keys Matter:**
```javascript
// ❌ Bad: Using index as key (can cause issues with lists that can be filtered or reordered)
{items.map((item, index) => <div key={index}>{item}</div>)}

// ✅ Good: Using unique identifier
{items.map((item) => <div key={item.id}>{item.name}</div>)}
```

---

## 2. React Hooks

### useState

**What is useState?**
`useState` is a Hook that lets you add state to functional components.

**Syntax:**
```javascript
const [state, setState] = useState(initialValue);
```

**Example:**
```javascript
import { useState } from 'react';

function Counter() {
  const [count, setCount] = useState(0);
  const [name, setName] = useState('');

  return (
    <div>
      <p>Count: {count}</p>
      <button onClick={() => setCount(count + 1)}>Increment</button>
      
      <input 
        value={name} 
        onChange={(e) => setName(e.target.value)} 
      />
      <p>Hello, {name}</p>
    </div>
  );
}
```

**Updating State:**
```javascript
// Direct update
setCount(5);

// Functional update (when new state depends on previous state)
setCount(prevCount => prevCount + 1);
```

---

### useEffect

**What is useEffect?**
`useEffect` performs side effects in functional components (like data fetching, subscriptions, DOM updates).

**Syntax:**
```javascript
useEffect(() => {
  // Side effect code
  return () => {
    // Cleanup code (optional)
  };
}, [dependencies]);
```

**Examples:**

**Runs after every render:**
```javascript
useEffect(() => {
  console.log('Component rendered');
});
```

**Runs once after initial mount:**
```javascript
useEffect(() => {
  console.log('Component mounted');
}, []);
```

**Runs when dependencies change:**
```javascript
function UserProfile({ userId }) {
  const [user, setUser] = useState(null);

  useEffect(() => {
    fetch(`/api/users/${userId}`)
      .then(res => res.json())
      .then(data => setUser(data));
  }, [userId]); // Runs when userId changes

  return <div>{user?.name}</div>;
}
```

**Cleanup Function:**
```javascript
useEffect(() => {
  const subscription = EventEmitter.subscribe('event', handler);

  return () => {
    // Cleanup when component unmounts or before next effect
    subscription.unsubscribe();
  };
}, []);
```

---

### useContext

**What is useContext?**
`useContext` allows you to access Context values without nested Consumer components.

**Setup:**
```javascript
// Create Context
const ThemeContext = React.createContext('light');

// Provider Component
function App() {
  const [theme, setTheme] = useState('light');

  return (
    <ThemeContext.Provider value={theme}>
      <ToggleButton />
      <Content />
    </ThemeContext.Provider>
  );
}
```

**Using Context:**
```javascript
function Content() {
  const theme = useContext(ThemeContext);
  
  return <div style={{ background: theme === 'light' ? '#fff' : '#333' }}>
    Current theme: {theme}
  </div>;
}
```

---

### useReducer

**What is useReducer?**
`useReducer` is an alternative to `useState` for managing complex state logic. It takes a reducer function and initial state.

**Syntax:**
```javascript
const [state, dispatch] = useReducer(reducer, initialState);
```

**Example:**
```javascript
const initialState = { count: 0 };

function reducer(state, action) {
  switch(action.type) {
    case 'INCREMENT':
      return { count: state.count + 1 };
    case 'DECREMENT':
      return { count: state.count - 1 };
    default:
      return state;
  }
}

function Counter() {
  const [state, dispatch] = useReducer(reducer, initialState);

  return (
    <div>
      <p>Count: {state.count}</p>
      <button onClick={() => dispatch({ type: 'INCREMENT' })}>+</button>
      <button onClick={() => dispatch({ type: 'DECREMENT' })}>-</button>
    </div>
  );
}
```

---

### useCallback

**What is useCallback?**
`useCallback` returns a memoized callback function. Useful when passing callbacks to optimized child components.

**Syntax:**
```javascript
const memoizedCallback = useCallback(
  () => { /* function body */ },
  [dependencies]
);
```

**Example:**
```javascript
function Parent() {
  const [count, setCount] = useState(0);

  // Without useCallback: new function on every render
  // With useCallback: same function unless count changes
  const handleClick = useCallback(() => {
    console.log(`Count is ${count}`);
  }, [count]);

  return <Child onClickHandler={handleClick} />;
}
```

---

### useMemo

**What is useMemo?**
`useMemo` returns a memoized value. Use it to avoid expensive calculations on every render.

**Syntax:**
```javascript
const memoizedValue = useMemo(
  () => expensiveCalculation(),
  [dependencies]
);
```

**Example:**
```javascript
function ListComponent({ numbers }) {
  // Expensive calculation
  const sortedNumbers = useMemo(() => {
    console.log('Sorting...');
    return numbers.sort((a, b) => a - b);
  }, [numbers]);

  return <div>{sortedNumbers.join(', ')}</div>;
}
```

---

### useRef

**What is useRef?**
`useRef` returns a mutable object that persists across renders. Commonly used to access DOM elements directly.

**Syntax:**
```javascript
const ref = useRef(initialValue);
```

**Example - Accessing DOM Elements:**
```javascript
function TextInput() {
  const inputRef = useRef(null);

  const focusInput = () => {
    inputRef.current.focus();
  };

  return (
    <>
      <input ref={inputRef} />
      <button onClick={focusInput}>Focus Input</button>
    </>
  );
}
```

**Storing Mutable Values:**
```javascript
function Timer() {
  const intervalRef = useRef(null);

  const startTimer = () => {
    intervalRef.current = setInterval(() => {
      // timer logic
    }, 1000);
  };

  const stopTimer = () => {
    clearInterval(intervalRef.current);
  };

  return (
    <>
      <button onClick={startTimer}>Start</button>
      <button onClick={stopTimer}>Stop</button>
    </>
  );
}
```

---

### Custom Hooks

**What are Custom Hooks?**
Custom Hooks are JavaScript functions that use React Hooks to reuse stateful logic.

**Example - useLocalStorage:**
```javascript
function useLocalStorage(key, initialValue) {
  const [storedValue, setStoredValue] = useState(() => {
    const item = window.localStorage.getItem(key);
    return item ? JSON.parse(item) : initialValue;
  });

  const setValue = (value) => {
    setStoredValue(value);
    window.localStorage.setItem(key, JSON.stringify(value));
  };

  return [storedValue, setValue];
}

// Usage:
function MyComponent() {
  const [name, setName] = useLocalStorage('name', 'Guest');
  return <div>{name}</div>;
}
```

**Example - useFetch:**
```javascript
function useFetch(url) {
  const [data, setData] = useState(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  useEffect(() => {
    fetch(url)
      .then(res => res.json())
      .then(data => {
        setData(data);
        setLoading(false);
      })
      .catch(err => {
        setError(err);
        setLoading(false);
      });
  }, [url]);

  return { data, loading, error };
}

// Usage:
function UserData() {
  const { data: user, loading, error } = useFetch('/api/user');
  
  if (loading) return <p>Loading...</p>;
  if (error) return <p>Error loading user</p>;
  return <div>{user.name}</div>;
}
```

---

## 3. Advanced React Concepts

### Higher-Order Components (HOC)

**What is an HOC?**
An HOC is a pattern for reusing component logic. It's a function that takes a component and returns an enhanced component.

**Syntax:**
```javascript
const EnhancedComponent = higherOrderComponent(OriginalComponent);
```

**Example:**
```javascript
// HOC that adds theme functionality
function withTheme(Component) {
  return function WrappedComponent(props) {
    const [theme, setTheme] = useState('light');

    return (
      <div style={{ background: theme === 'light' ? '#fff' : '#333' }}>
        <Component {...props} theme={theme} setTheme={setTheme} />
      </div>
    );
  };
}

// Original Component
function MyComponent({ theme, setTheme }) {
  return (
    <button onClick={() => setTheme(theme === 'light' ? 'dark' : 'light')}>
      Current theme: {theme}
    </button>
  );
}

// Enhanced Component
const EnhancedComponent = withTheme(MyComponent);
```

---

### Render Props

**What are Render Props?**
A render prop is a function prop that a component uses to know what to render. It's an alternative to HOC.

**Example:**
```javascript
// Component with render prop
function MouseTracker({ render }) {
  const [position, setPosition] = useState({ x: 0, y: 0 });

  const handleMouseMove = (e) => {
    setPosition({ x: e.clientX, y: e.clientY });
  };

  return <div onMouseMove={handleMouseMove}>{render(position)}</div>;
}

// Usage
function App() {
  return (
    <MouseTracker
      render={({ x, y }) => (
        <div>Mouse is at ({x}, {y})</div>
      )}
    />
  );
}
```

---

### Error Boundaries

**What are Error Boundaries?**
Error Boundaries are React components that catch JavaScript errors in their child components.

**Example:**
```javascript
class ErrorBoundary extends React.Component {
  constructor(props) {
    super(props);
    this.state = { hasError: false, error: null };
  }

  static getDerivedStateFromError(error) {
    return { hasError: true, error };
  }

  componentDidCatch(error, errorInfo) {
    console.log('Error caught:', error, errorInfo);
  }

  render() {
    if (this.state.hasError) {
      return <h1>Something went wrong: {this.state.error.message}</h1>;
    }

    return this.props.children;
  }
}

// Usage
function App() {
  return (
    <ErrorBoundary>
      <MyComponent />
    </ErrorBoundary>
  );
}
```

---

### Code Splitting & Lazy Loading

**What is Code Splitting?**
Code splitting allows you to split your code into smaller chunks and load them on demand.

**Using React.lazy() and Suspense:**
```javascript
import { lazy, Suspense } from 'react';

// Lazy load the component
const HeavyComponent = lazy(() => import('./HeavyComponent'));

function App() {
  return (
    <Suspense fallback={<div>Loading...</div>}>
      <HeavyComponent />
    </Suspense>
  );
}
```

---

### Portals

**What are Portals?**
Portals allow you to render a component's children into a different part of the DOM.

**Example:**
```javascript
import ReactDOM from 'react-dom';

function Modal({ children }) {
  return ReactDOM.createPortal(
    <div style={{ position: 'fixed', zIndex: 1000 }}>
      {children}
    </div>,
    document.body
  );
}

// Usage
function App() {
  return (
    <div>
      <h1>Main Content</h1>
      <Modal>
        <p>This renders in document.body</p>
      </Modal>
    </div>
  );
}
```

---

### Suspense

**What is Suspense?**
Suspense lets you "wait" for code to load and declaratively specify a loading state.

**Example:**
```javascript
import { Suspense, lazy } from 'react';

const OtherComponent = lazy(() => import('./OtherComponent'));

function MyComponent() {
  return (
    <Suspense fallback={<div>Loading...</div>}>
      <OtherComponent />
    </Suspense>
  );
}
```

---

## 4. Performance Optimization

### React.memo

**What is React.memo?**
`React.memo` prevents a component from re-rendering if its props haven't changed.

**Example:**
```javascript
// Without React.memo
function UserCard({ name, age }) {
  console.log('Rendering UserCard');
  return <div>{name}, {age}</div>;
}

// With React.memo
const MemoizedUserCard = React.memo(UserCard);

// Usage
function App() {
  const [count, setCount] = useState(0);

  return (
    <>
      <button onClick={() => setCount(count + 1)}>Increment: {count}</button>
      <MemoizedUserCard name="John" age={25} />
    </>
  );
}
// UserCard only re-renders when name or age changes
```

**Custom Comparison:**
```javascript
const MemoizedComponent = React.memo(
  Component,
  (prevProps, nextProps) => {
    // Return true if props are equal (don't re-render)
    // Return false if props are different (re-render)
    return prevProps.id === nextProps.id;
  }
);
```

---

### useMemo vs useCallback

**Difference:**
- `useMemo` memoizes a **value**
- `useCallback` memoizes a **function**

**Example:**
```javascript
function Parent() {
  const [count, setCount] = useState(0);

  // useMemo: memoize expensive calculation
  const expensiveValue = useMemo(() => {
    return count * 2;
  }, [count]);

  // useCallback: memoize function for child component
  const handleClick = useCallback(() => {
    console.log('Clicked');
  }, []);

  return (
    <Child value={expensiveValue} onClick={handleClick} />
  );
}
```

---

### Virtual DOM

**What is Virtual DOM?**
The Virtual DOM is a lightweight JavaScript representation of the actual DOM. React uses it to efficiently update the UI.

**How it works:**
1. When state changes, React creates a new Virtual DOM
2. React compares (diffs) the new Virtual DOM with the old one
3. React updates only the changed parts in the real DOM (reconciliation)
4. This process is much faster than updating the entire DOM

**Benefits:**
- Better performance
- Batch updates
- Cross-browser compatibility

---

### Key Prop Best Practices

**Why Keys Matter:**
```javascript
// ❌ Bad
<ul>
  {items.map((item, index) => <li key={index}>{item}</li>)}
</ul>

// ✅ Good
<ul>
  {items.map((item) => <li key={item.id}>{item.name}</li>)}
</ul>
```

**Issues with Index Keys:**
- When list is reordered, filtered, or items are added/removed, indices change
- This can cause bugs with component state and form inputs

---

## 5. State Management

### Context API

**What is Context API?**
Context API allows you to pass data through the component tree without manually passing props at every level.

**Complete Example:**
```javascript
// Step 1: Create Context
const UserContext = React.createContext();

// Step 2: Create Provider
function UserProvider({ children }) {
  const [user, setUser] = useState({ name: 'John', email: 'john@example.com' });

  return (
    <UserContext.Provider value={{ user, setUser }}>
      {children}
    </UserContext.Provider>
  );
}

// Step 3: Use in components
function UserProfile() {
  const { user } = useContext(UserContext);
  return <div>{user.name}</div>;
}

// Step 4: Wrap app with provider
function App() {
  return (
    <UserProvider>
      <UserProfile />
    </UserProvider>
  );
}
```

---

### Redux Basics

**What is Redux?**
Redux is a state management library that uses a centralized store, actions, and reducers.

**Core Concepts:**
- **Store**: Holds the entire app state
- **Actions**: Objects that describe what happened
- **Reducers**: Functions that update state based on actions
- **Dispatch**: Sends actions to the store

**Example:**
```javascript
import { createStore } from 'redux';

// Step 1: Define reducer
const initialState = { count: 0 };

function counterReducer(state = initialState, action) {
  switch(action.type) {
    case 'INCREMENT':
      return { count: state.count + 1 };
    case 'DECREMENT':
      return { count: state.count - 1 };
    default:
      return state;
  }
}

// Step 2: Create store
const store = createStore(counterReducer);

// Step 3: Subscribe and dispatch
store.subscribe(() => {
  console.log('State:', store.getState());
});

store.dispatch({ type: 'INCREMENT' }); // { count: 1 }
store.dispatch({ type: 'INCREMENT' }); // { count: 2 }
```

**Using Redux with React:**
```javascript
import { useSelector, useDispatch } from 'react-redux';

function Counter() {
  const count = useSelector(state => state.count);
  const dispatch = useDispatch();

  return (
    <div>
      <p>Count: {count}</p>
      <button onClick={() => dispatch({ type: 'INCREMENT' })}>+</button>
      <button onClick={() => dispatch({ type: 'DECREMENT' })}>-</button>
    </div>
  );
}
```

---

## 6. React Ecosystem & Tools

### React Router

**What is React Router?**
React Router is a library for handling navigation in single-page applications.

**Basic Setup:**
```javascript
import { BrowserRouter, Routes, Route, Link } from 'react-router-dom';

function App() {
  return (
    <BrowserRouter>
      <nav>
        <Link to="/">Home</Link>
        <Link to="/about">About</Link>
        <Link to="/users/1">User 1</Link>
      </nav>

      <Routes>
        <Route path="/" element={<Home />} />
        <Route path="/about" element={<About />} />
        <Route path="/users/:id" element={<UserDetail />} />
      </Routes>
    </BrowserRouter>
  );
}

function UserDetail() {
  const { id } = useParams();
  return <div>User {id}</div>;
}
```

**Navigation Programmatically:**
```javascript
import { useNavigate } from 'react-router-dom';

function Login() {
  const navigate = useNavigate();

  const handleLogin = () => {
    // Login logic
    navigate('/dashboard');
  };

  return <button onClick={handleLogin}>Login</button>;
}
```

---

### Form Handling

**Controlled Components:**
```javascript
function LoginForm() {
  const [formData, setFormData] = useState({ email: '', password: '' });

  const handleChange = (e) => {
    const { name, value } = e.target;
    setFormData(prev => ({ ...prev, [name]: value }));
  };

  const handleSubmit = (e) => {
    e.preventDefault();
    console.log(formData);
  };

  return (
    <form onSubmit={handleSubmit}>
      <input
        name="email"
        value={formData.email}
        onChange={handleChange}
        placeholder="Email"
      />
      <input
        name="password"
        type="password"
        value={formData.password}
        onChange={handleChange}
        placeholder="Password"
      />
      <button type="submit">Login</button>
    </form>
  );
}
```

**Using react-hook-form:**
```javascript
import { useForm } from 'react-hook-form';

function LoginForm() {
  const { register, handleSubmit, formState: { errors } } = useForm();

  const onSubmit = (data) => console.log(data);

  return (
    <form onSubmit={handleSubmit(onSubmit)}>
      <input {...register('email', { required: 'Email is required' })} />
      {errors.email && <p>{errors.email.message}</p>}

      <input {...register('password', { required: 'Password is required' })} type="password" />
      {errors.password && <p>{errors.password.message}</p>}

      <button type="submit">Login</button>
    </form>
  );
}
```

---

### Testing React Components

**Using Jest and React Testing Library:**

**Example Component:**
```javascript
function Counter() {
  const [count, setCount] = useState(0);

  return (
    <div>
      <p>Count: {count}</p>
      <button onClick={() => setCount(count + 1)}>Increment</button>
    </div>
  );
}
```

**Test:**
```javascript
import { render, screen, fireEvent } from '@testing-library/react';
import Counter from './Counter';

test('increments count when button is clicked', () => {
  render(<Counter />);
  
  const button = screen.getByText('Increment');
  fireEvent.click(button);
  
  expect(screen.getByText('Count: 1')).toBeInTheDocument();
});
```

**Testing Async Operations:**
```javascript
test('fetches and displays user data', async () => {
  render(<UserProfile userId={1} />);
  
  // Wait for the element to appear
  const userName = await screen.findByText('John Doe');
  expect(userName).toBeInTheDocument();
});
```

---

## 7. Common Interview Questions

### Q1: What is React and why use it?
**Answer:**
React is a JavaScript library for building user interfaces with reusable components. 
Key benefits:
- **Component-based**: Build encapsulated components
- **Virtual DOM**: Better performance
- **Unidirectional data flow**: Easy to debug
- **Large ecosystem**: Lots of third-party libraries
- **Community support**: Large and active community

---

### Q2: Difference between Props and State
**Answer:**

| Props | State |
|-------|-------|
| Read-only | Mutable |
| Passed from parent to child | Managed within component |
| Used to configure components | Used for dynamic data |
| Cannot be changed by child | Can be changed using setState |

---

### Q3: Explain the Virtual DOM and reconciliation
**Answer:**
The Virtual DOM is a lightweight JavaScript representation of the real DOM. React uses it to:
1. Create a Virtual DOM when state changes
2. Compare (diff) new Virtual DOM with old one
3. Calculate which parts changed
4. Update only those parts in the real DOM

This process is called reconciliation and makes React fast.

---

### Q4: What are keys and why are they important?
**Answer:**
Keys help React identify which items have changed. They:
- Help React maintain component state during re-renders
- Improve performance
- Should be unique and stable
- Never use array index as key if list can be reordered

---

### Q5: What is the difference between controlled and uncontrolled components?
**Answer:**

**Controlled Components:**
```javascript
const [value, setValue] = useState('');
<input value={value} onChange={(e) => setValue(e.target.value)} />
```
- React state is the "single source of truth"
- Every state change triggers a re-render
- Easier to validate and manipulate

**Uncontrolled Components:**
```javascript
const inputRef = useRef();
<input ref={inputRef} />
// Access value: inputRef.current.value
```
- DOM is the source of truth
- Similar to traditional HTML forms
- Less React overhead

---

### Q6: Explain useEffect cleanup function
**Answer:**
The cleanup function runs before the component unmounts or before the next effect runs:

```javascript
useEffect(() => {
  const subscription = DataSource.subscribe(handleChange);
  
  // Cleanup function
  return () => {
    subscription.unsubscribe(); // Prevent memory leaks
  };
}, []);
```

Cleanup is important for:
- Removing event listeners
- Clearing timers
- Canceling API requests
- Unsubscribing from observables

---

### Q7: What is the difference between shallow and deep copying in React?
**Answer:**

**Shallow Copy:**
```javascript
// Creates new object but references same nested objects
const user = { name: 'John', address: { city: 'NYC' } };
const userCopy = { ...user }; // Shallow copy
userCopy.address.city = 'LA'; // Changes original!
```

**Deep Copy:**
```javascript
const userCopy = JSON.parse(JSON.stringify(user)); // Deep copy
userCopy.address.city = 'LA'; // Original unchanged
```

In React state updates, always create new references for nested objects:
```javascript
// Update nested state
setUser(prev => ({
  ...prev,
  address: { ...prev.address, city: 'LA' }
}));
```

---

### Q8: What is the difference between useMemo and useCallback?
**Answer:**
- **useMemo** memoizes a computed value
- **useCallback** memoizes a function

```javascript
// useMemo - memoize a value
const expensiveValue = useMemo(() => complexCalculation(), [deps]);

// useCallback - memoize a function
const memoizedFunc = useCallback(() => { /* logic */ }, [deps]);
```

Use them to:
- Avoid unnecessary re-renders
- Prevent expensive recalculations
- Optimize child component rendering

---

### Q9: How do you handle errors in React?
**Answer:**
1. **Error Boundaries** - for component errors
2. **try-catch** - for regular JavaScript errors
3. **Error states** - in useState for async operations

```javascript
class ErrorBoundary extends React.Component {
  componentDidCatch(error, errorInfo) {
    console.log(error);
  }

  render() {
    if (this.state.hasError) {
      return <h1>Error occurred</h1>;
    }
    return this.props.children;
  }
}
```

---

### Q10: What is the React Fragment and why use it?
**Answer:**
React Fragment allows you to return multiple elements without wrapping in a div.

```javascript
// Without Fragment - unnecessary div in DOM
function MyComponent() {
  return (
    <div>
      <p>Paragraph 1</p>
      <p>Paragraph 2</p>
    </div>
  );
}

// With Fragment - no wrapper div
function MyComponent() {
  return (
    <>
      <p>Paragraph 1</p>
      <p>Paragraph 2</p>
    </>
  );
}
```

Benefits:
- Cleaner HTML structure
- Improves performance
- No extra DOM nodes

---

### Q11: Explain the concept of "lifting state up"
**Answer:**
When multiple components need to share state, you move the state to their common parent component.

```javascript
// Parent component
function App() {
  const [count, setCount] = useState(0);

  return (
    <>
      <Counter count={count} onIncrement={() => setCount(count + 1)} />
      <Display count={count} />
    </>
  );
}

// Child components receive state and handlers as props
function Counter({ count, onIncrement }) {
  return <button onClick={onIncrement}>Count: {count}</button>;
}

function Display({ count }) {
  return <p>Current count: {count}</p>;
}
```

---

### Q12: What is React.StrictMode and why use it?
**Answer:**
React.StrictMode is a tool for highlighting potential problems in your application.

```javascript
<React.StrictMode>
  <App />
</React.StrictMode>
```

What it checks:
- Unsafe lifecycle methods
- Legacy string ref API
- Unexpected side effects
- Deprecated APIs

**Note:** Only runs in development, not in production.

---

## Tips for Interview Preparation

✅ **Do:**
- Practice building small projects
- Understand concepts deeply, not just memorize
- Code along with examples
- Read official React documentation
- Solve LeetCode/HackerRank React problems
- Build a portfolio project

❌ **Don't:**
- Just memorize code snippets
- Skip the "why" behind concepts
- Ignore performance optimization
- Forget about error handling
- Ignore testing

---

## Quick Reference Checklist

- [ ] Understand JSX and component basics
- [ ] Know difference between props and state
- [ ] Master useState, useEffect hooks
- [ ] Understand useContext for prop drilling
- [ ] Know React.memo and performance optimization
- [ ] Understand controlled vs uncontrolled components
- [ ] Know Error Boundaries
- [ ] Understand routing with React Router
- [ ] Know common testing patterns
- [ ] Practice at least 3 mini projects

---

**Good luck with your interview! 🚀**

