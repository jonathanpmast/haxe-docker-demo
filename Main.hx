import h2d.Font;

class Main extends hxd.App {
    override function init() {
        var f = hxd.res.DefaultFont.get();
        f.resizeTo(200);
        var tf = new h2d.Text(f, s2d);
        tf.text = "Hello Woooooorld!";
    }
    static function main() {
        new Main();
    }
}