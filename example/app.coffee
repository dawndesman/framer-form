{Scene, Mesh, Model} = require '../form.coffee'

scene = new Scene
	width: Screen.width
	height: Screen.height

new Model
	path: './models/skull.obj'
	parent: scene
	material: new Form.MeshNormalMaterial
	scale: .01
	onLoad: (model) ->

		console.log model

		model.animate
			rotationY: 360
			options:
				time: 1

		scene.on Events.MouseMove, (e) ->
			model.rotationY = Utils.modulate(e.clientX, [0, Screen.width], [-30, 30], true)
			model.rotationX = Utils.modulate(e.clientY, [0, Screen.height], [-30, 30], true)