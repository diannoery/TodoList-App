# SwiftUI Todo List App

Aplikasi Todo List sederhana yang dibuat menggunakan SwiftUI dan terintegrasi dengan REST API. Aplikasi ini menerapkan arsitektur MVVM (Model-View-ViewModel) dan menggunakan async/await untuk handling API calls.

## Fitur

- ✅ Menampilkan daftar todos
- ✅ Menambahkan todo baru
- ✅ Menandai todo sebagai selesai/belum selesai
- ✅ Menghapus todo (swipe to delete)
- ✅ Menghapus semua todos sekaligus
- ✅ Loading indicator
- ✅ Error handling
- ✅ Konfirmasi sebelum menghapus semua
- ✅ Responsive UI

## Teknologi yang Digunakan

- SwiftUI
- Async/Await untuk networking
- JSONPlaceholder API sebagai backend
- MVVM Architecture Pattern
- Concurrent programming untuk bulk delete

## Struktur Proyek

```
TodoList/
├── App/
│   └── TodoListApp.swift
├── Models/
│   └── Todo.swift
├── Services/
│   └── TodoService.swift
├── ViewModels/
│   └── TodoViewModel.swift
└── Views/
    ├── ContentView.swift
    └── TodoRowView.swift
```

## Persyaratan

- iOS 15.0+
- Xcode 13.0+
- Swift 5.5+

## Instalasi

1. Clone repository ini
```bash
git clone https://github.com/username/todo-list-app.git
```

2. Buka proyek di Xcode
```bash
cd todo-list-app
open TodoList.xcodeproj
```

3. Build dan jalankan aplikasi di simulator atau perangkat fisik

## Penggunaan

### Menambah Todo
1. Ketik judul todo di text field bagian bawah
2. Tap tombol + untuk menambahkan

### Menandai Todo Selesai
- Tap lingkaran di sebelah kiri todo untuk toggle status selesai/belum

### Menghapus Single Todo
- Swipe todo ke kiri untuk menghapus, atau
- Tap Edit dan kemudian tap tombol delete (-) merah

### Menghapus Semua Todo
1. Tap tombol trash di pojok kiri atas
2. Konfirmasi penghapusan di alert yang muncul

## Arsitektur

### Models
- `Todo`: Model data untuk item todo

### Views
- `ContentView`: View utama yang menampilkan daftar todo
- `TodoRowView`: Component untuk menampilkan single todo item

### ViewModels
- `TodoViewModel`: Mengelola state dan business logic

### Services
- `TodoService`: Handling API calls ke backend

## API Endpoints

Aplikasi ini menggunakan JSONPlaceholder API dengan endpoint:
- GET /todos: Mengambil semua todos
- POST /todos: Membuat todo baru
- PATCH /todos/{id}: Update status todo
- DELETE /todos/{id}: Menghapus todo

## Kontribusi

1. Fork repository
2. Buat branch fitur baru (`git checkout -b feature/AmazingFeature`)
3. Commit perubahan (`git commit -m 'Add some AmazingFeature'`)
4. Push ke branch (`git push origin feature/AmazingFeature`)
5. Buat Pull Request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details

## Kontak

Dian Noery - diannoery29@gmail.com

Project Link: [https://github.com/diannoery/todo-list-app](https://github.com/username/todo-list-app)
