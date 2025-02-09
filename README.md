# RickAndMorty-SwiftUI

## 🚀 SwiftUI Application with Clean Architecture and SOLID Principles

This project is a **Rick and Morty** application built using **SwiftUI**, following **Clean Architecture** and **SOLID** principles.  
It implements a modular architecture with **dependency injection, repositories, use cases, and image caching**.

Additionally, the app uses **SwiftData** for local storage and **NSCache** for image caching.

---

## 📸 Screenshots
📌

---

## 🏗 Architecture
The application is structured based on **Clean Architecture**, separating business logic from infrastructure and UI layers.

### 📂 Project Structure:

```
RickAndMorty-SwiftUI/
│── Assets.xcassets/
│   ├── AccentColor.colorset/
│   ├── AppIcon.appiconset/
│── CompositionRoot/
│   ├── CharacterDetailFactory.swift
│   ├── CharacterListFactory.swift
│── Data/
│   ├── Cache/
│   │   ├── CharacterImageCache.swift
│   │   ├── CharacterListCacheDataSourceType.swift
│   │   ├── CompositeCharacterListCacheDataSource.swift
│   │   ├── InMemoryCharacterListCacheDataSource.swift
│   ├── DTOs/
│   │   ├── CharacterDTO.swift
│   │   ├── CharacterResponseDTO.swift
│   │   ├── LocationDTO.swift
│   ├── Networking/
│   │   ├── CharacterImageRemoteDataSource.swift
│   │   ├── Endpoint.swift
│   │   ├── HTTPClient.swift
│   │   ├── HTTPClientError.swift
│   │   ├── HTTPMethod.swift
│   │   ├── RemoteDataSource.swift
│   │   ├── RemoteDataSourceType.swift
│   ├── Repositories/
│   │   ├── CharacterImageRepository.swift
│   │   ├── CharacterRepository.swift
│── Domain/
│   ├── Entities/
│   │   ├── CharacterEntity.swift
│   │   ├── LocationEntity.swift
│   ├── Interfaces/
│   │   ├── CharacterImageRepositoryType.swift
│   │   ├── CharacterRepositoryType.swift
│   ├── UseCases/
│   │   ├── DownloadCharacterImageUseCase.swift
│   │   ├── GetAllCharactersUseCase.swift
│   ├── CharacterDomainError.swift
│   ├── CharacterImageError.swift
│── Infraestructure/
│   ├── Data/
│   │   ├── CharacterData.swift
│   │   ├── CharacterListStorage.swift
│   │   ├── CharacterListStorageType.swift
│   │   ├── LocationData.swift
│   │   ├── LocationDataMapper.swift
│   │   ├── PersistentCharacterListCacheDataSource.swift
│   ├── Networking/
│   │   ├── APIConstants.swift
│   │   ├── URLSessionErrorResolver.swift
│   │   ├── URLSessionHTTPCLient.swift
│   │   ├── URLSessionRequestMaker.swift
│── Presentation/
│   ├── ViewModels/
│   │   ├── CharacterListViewModel.swift
│   ├── Views/
│   │   ├── CharacterListView.swift
│   ├── Modifiers/
│   │   ├── AlertModifier.swift
│   │   ├── View+Modifiers.swift
│   ├── Mappers/
│   │   ├── CharacterPresentableErrorMapper.swift
│   ├── Extensions/
│── Preview Content/
│   ├── Preview Assets.xcassets/
│   │   ├── preview_character.imageset/
│   │   │   ├── Contents.json
│   │   │   ├── RickSanchez.jpeg
│   ├── PreviewData.swift
│── UI/
│   ├── BottomNameView.swift
│   ├── CharacterListItemView.swift
│   ├── Image+Styles.swift
│── Utils/
│   ├── Foundation+Extensions.swift
│── RickAndMorty_SwiftUIApp.swift
│── RickAndMorty_SwiftUI.entitlements
│── RickAndMorty_SwiftUI.xcodeproj/
│   ├── project.pbxproj
│   ├── project.xcworkspace/
│   │   ├── contents.xcworkspacedata
│   │   ├── xcshareddata/
│   │   ├── xcuserdata/
│── RickAndMorty-SwiftUITests/
│   ├── Data/
│   │   ├── CharacterDomainErrorMapperTests.swift
│   │   ├── CharacterDomainMapperTests.swift
│   │   ├── CharacterRepositoryTests.swift
│   │   ├── CompositeCharacterListCacheDataSourceTests.swift
│   │   ├── RemoteDataSourceTests.swift
│   ├── Domain/
│   │   ├── GetAllCharactersUseCaseTests.swift
│   ├── Helpers/
│   │   ├── CharacterDTOTestData.swift
│   │   ├── CharacterDataTestData.swift
│   │   ├── CharacterEntityTestData.swift
│   │   ├── CharacterListCacheDataSourceStub.swift
│   │   ├── CharacterListRemoteDataSourceStub.swift
│   │   ├── CharacterListStorageStub.swift
│   │   ├── CharacterRepositoryStub.swift
│   │   ├── Equatable.swift
│   │   ├── GetAllCharactersUseCaseStub.swift
│   │   ├── HTTPClientStub.swift
│   ├── Infraestructure/
│   │   ├── PersistentCharacterListCacheDataSourceTests.swift
│   ├── Utils/
│   │   ├── ResultExtensionTests.swift
```

✅ **Composition Root (`CompositionRoot`)**  
Defines the dependency injection structure for the app.

✅ **Infrastructure (`Infrastructure`)**  
Manages networking, caching, and system services.

✅ **Data (`Data`)**  
Contains **DTOs**, **repositories**, and data sources.

✅ **Domain (`Domain`)**  
Includes **entities, interfaces, and use cases** for business logic.

✅ **Presentation (`Presentation`)**  
Contains **ViewModels, Views, Modifiers, Mappers, and Extensions**.

✅ **UI (`UI`)**  
SwiftUI components that structure the user interface.

✅ **Utils (`Utils`)**  
Extensions and utilities to support the application.

---

### 📱 SwiftUI Previews  
All **SwiftUI views** include **previews with mock data** to facilitate real-time editing within **Xcode Canvas**.

This allows working visually without needing to run the app on a simulator or device, speeding up development and improving the design experience.

#### Example of a **SwiftUI Preview**:

```swift
#Preview {
    CharacterListView(viewModel: .preview)
}
```

---

## 🛠 Technologies and Tools
- ✅ **Swift 5.9+**
- ✅ **SwiftUI**
- ✅ **Combine for data binding**
- ✅ **Async/Await for concurrency**
- ✅ **Clean Architecture + SOLID**
- ✅ **URLSession for networking**
- ✅ **NSCache for image caching**
- ✅ **SwiftData for local storage**
- ✅ **ViewModifiers for UI customization**
- ✅ **Dependency Injection**

---

## 📡 API Used
This application consumes the **Rick and Morty API**:
🔗 [https://rickandmortyapi.com](https://rickandmortyapi.com)

📌 **Example request to fetch characters:**
```http
GET https://rickandmortyapi.com/api/character
```

---

## 🎯 Key Features
✅ **Character list with cached images**
✅ **Efficient image caching with `NSCache`**  
✅ **Local storage with `SwiftData`**  
✅ **Error handling with `Result<T, Error>`**  
✅ **Modular and scalable design**  
✅ **Unit tests covering all use cases except UI tests (planned for future updates)**

---

## 🏗 How to Run the Project
1. **Clone the repository**  
   ```bash
   git clone https://github.com/your-username/RickAndMorty-SwiftUI.git
   cd RickAndMorty-SwiftUI
   ```
2. **Open in Xcode**  
   📂 Open `RickAndMorty_SwiftUI.xcodeproj` in Xcode.
3. **Build and Run**  
   - 📱 **Select a simulator or physical device**
   - ▶️ **Press "Run" (⌘R) in Xcode**  

---

## 🔥 Future Enhancements
📌 **Add a use case for fetching character details**
📌 **Implement a character detail screen displaying all character information**
📌 **Add unit tests for the presentation layer**
📌 **Add unit tests for the image download use case**
📌 **Implement UI tests**
📌 **Add pagination to the character list**
📌 **Implement a splash screen with animations**
📌 **Refactor API logic into a separate local Swift Package (SPM)**

---

## 👨‍💻 Author
💡 _Developed by_ **Francisco José Navarro García**  
