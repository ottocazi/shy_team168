<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <style>
    
.letter {
	display: inline-block;
	font-weight: 900;
	font-size: 5em;
	margin: 0.1em;
	position: relative;
	color: #00B4F1;
	transform-style: preserve-3d;
	perspective: 500;
	z-index: 1;
}

.letter:before, .letter:after {
	position: absolute;
	content: attr(data-letter);
	transform-origin: top left;
	top: 0;
	left: 0;
}

.letter, .letter:before, .letter:after {
	transition: all 0.3s ease-in-out;
}

.letter:before {
	color: #fff;
	text-shadow: -1px 0px 1px rgba(255, 255, 255, .8), 1px 0px 1px
		rgba(0, 0, 0, .8);
	z-index: 3;
	transform: rotateX(0deg) rotateY(-15deg) rotateZ(0deg);
}

.letter:after {
	color: rgba(0, 0, 0, .11);
	z-index: 2;
	transform: scale(1.08, 1) rotateX(0deg) rotateY(0deg) rotateZ(0deg)
		skew(0deg, 1deg);
}

.letter:hover:before {
	color: #fafafa;
	transform: rotateX(0deg) rotateY(-40deg) rotateZ(0deg);
}

.letter:hover:after {
	transform: scale(1.08, 1) rotateX(0deg) rotateY(40deg) rotateZ(0deg)
		skew(0deg, 22deg);
}
    
    </style>
    
    
    
    
    <Body>
    <span
					class="letter" id="shy" data-letter="s">s</span> <span
					class="letter" id="shy" data-letter="h">h</span> <span
					class="letter" id="shy" data-letter="y">y</span>
    
    </Body>