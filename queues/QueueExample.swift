import Foundation

// MARK: - Modelo de dados
struct Task {
    let id: Int
    let description: String
}

// MARK: - Fila genérica
class Queue<T> {
    private var elements: [T] = []

    func enqueue(_ element: T) {
        elements.append(element)
    }

    func dequeue() -> T? {
        guard !elements.isEmpty else { return nil }
        return elements.removeFirst()
    }

    func isEmpty() -> Bool {
        return elements.isEmpty
    }

    func peek() -> T? {
        return elements.first
    }

    func count() -> Int {
        return elements.count
    }
}

// MARK: - Funções que interagem com a fila
func produceTasks() -> Queue<Task> {
    let queue = Queue<Task>()
    for i in 1...5 {
        let task = Task(id: i, description: "Processar item \(i)")
        queue.enqueue(task)
        print("🟩 Adicionado à fila: \(task.description)")
    }
    return queue
}

func processTasks(from queue: Queue<Task>) {
    while !queue.isEmpty() {
        if let task = queue.dequeue() {
            print("⚙️  Processando: \(task.description)")
            // Simula algum processamento
            Thread.sleep(forTimeInterval: 0.5)
        }
    }
    print("✅ Todos os itens foram processados.")
}

// MARK: - Execução
let taskQueue = produceTasks()
processTasks(from: taskQueue)

