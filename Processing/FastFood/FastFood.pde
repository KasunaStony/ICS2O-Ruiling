void setup(){
float b, f, so, t;

println("Welcome to McMuir's!  May I take your order...");
println();


b = getFloat("Enter the number of burgers:");
println();


f = getFloat("Enter the number of fries:");
println();


so = getFloat("Enter the number of sodas:");
println();
println();

t = b * 1.69 + f * 1.09 + so * 0.99;

println("Sub-Total:     $" + t);
println("Tax (13%):     $" + (t * 0.065));
println("Final Cost:    $" + (t * 1.065));
}