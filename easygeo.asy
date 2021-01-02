import geometry;

//返回与直线AB切于A且过C的圆
circle tangentABC(point A,point B,point C) 
{
	point B2=scale(length(C-A)^2/length(C-B)^2,C)*B;
	return circle(B2,A,B);
}

//A在圆c上,求直线AB与圆c的另外一个交点
point intersectionpoint(circle c,point A,point B)
{
	point[] p=intersectionpoints(c,line(A,B));
	if(p[0]==A)
		return B;
	else
		return p[1];
}

//返回三角形ABC的垂心
point chuixin(point A,point B,point C)
{
	return orthocentercenter(triangle(A,B,C));
}

//默认返回 \angle BAC 的内角平分线,如果 sharp=false,返回外角平分线
line bisector(point A,point B,point C,bool sharp=true)
{
	if(sharp)
		return bisector(line(A,false,B),line(A,false,C));
	else
		return bisector(line(A,false,B),line(A,false,C),false);
}

//返回分割满足 AP=t PB 的点P,向量意义下,也就是高中教材里的定比分点
point fendian(point A,point B,real t)
{
	point C=(A+t*B)/(1+t);
	return C;
}

//返回到A,B距离之比为t的阿氏圆
circle acircle(point A,point B,real t)
{
	return circle(fendian(A,B,t),fendian(A,B,-t));
}
