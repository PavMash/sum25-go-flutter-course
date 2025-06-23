package taskmanager

import (
	"errors"
	"time"
)

var (
	// ErrTaskNotFound is returned when a task is not found
	ErrTaskNotFound = errors.New("task not found")
	// ErrEmptyTitle is returned when the task title is empty
	ErrEmptyTitle = errors.New("task title cannot be empty")
	// ErrInvalidID is returned when the task ID is invalid
	ErrInvalidID = errors.New("invalid task ID")
)

// Task represents a single task
type Task struct {
	ID          int
	Title       string
	Description string
	Done        bool
	CreatedAt   time.Time
}

// TaskManager manages a collection of tasks
type TaskManager struct {
	tasks  map[int]*Task
	nextID int
}

// NewTaskManager creates a new task manager
func NewTaskManager() *TaskManager {
	var newManager TaskManager
	newManager.tasks = make(map[int]*Task)
	newManager.nextID = 1
	var pointerToManager = &newManager
	return pointerToManager
}

// AddTask adds a new task to the manager
func (tm *TaskManager) AddTask(title, description string) (*Task, error) {
	if title == "" {
		return nil, ErrEmptyTitle
	}

	var newId = tm.nextID
	tm.nextID++

	newTask := Task{
		ID:          newId,
		Title:       title,
		Description: description,
		Done:        false,
		CreatedAt:   time.Now(),
	}
	tm.tasks[newId] = &newTask
	return &newTask, nil
}

// UpdateTask updates an existing task
func (tm *TaskManager) UpdateTask(id int, title, description string, done bool) error {
	task, exisits := tm.tasks[id]
	if !exisits {
		return ErrTaskNotFound
	}
	if task.ID != id {
		return ErrInvalidID
	}
	if title == "" {
		return ErrEmptyTitle
	}
	task.Title = title
	task.Description = description
	task.Done = done
	return nil
}

// DeleteTask removes a task from the manager
func (tm *TaskManager) DeleteTask(id int) error {
	_, exists := tm.tasks[id]
	if !exists {
		return ErrTaskNotFound
	}
	delete(tm.tasks, id)
	return nil
}

// GetTask retrieves a task by ID
func (tm *TaskManager) GetTask(id int) (*Task, error) {
	task, exists := tm.tasks[id]
	if !exists {
		return nil, ErrTaskNotFound
	}
	return task, nil
}

// ListTasks returns all tasks, optionally filtered by done status
func (tm *TaskManager) ListTasks(filterDone *bool) []*Task {
	filteredTasks := make([]*Task, 0, len(tm.tasks))
	for _, task := range tm.tasks {
		if task.Done == *filterDone {
			filteredTasks = append(filteredTasks, task)
		}
	}
	return filteredTasks
}
