import Foundation
import Scenes
import Igis

  /*
     This class is responsible for rendering the background.
   */


class Background : RenderableEntity {
    let imageURL = "https://codermerlin.academy/users/krishna-shah/images/usmap.svg"

    let usmap : Image
    init() {
        // Using a meaningful name can be helpful for debugging
        guard let usmapURL = URL(string:imageURL) else {
            fatalError("Failed to create URL for image")
        }
        usmap = Image(sourceURL:usmapURL)
        super.init(name:"Background")
    }

    override func setup(canvasSize: Size, canvas: Canvas) {
        usmap.renderMode = .destinationRect(Rect(topLeft:Point(), size:canvasSize))
        canvas.setup(usmap)
    }

    override func render(canvas: Canvas) {
        if usmap.isReady {
            canvas.render(usmap)
        }
    }
}
