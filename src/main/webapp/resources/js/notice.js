const openButton = document.querySelector('.open');
const container = document.querySelector('.container');
const closeButton = document.querySelector('.close');
const noticeModal = document.querySelector('#myAlarmBlt');

openButton.addEventListener('click', ()=>{
    container.style.display='flex';
    openButton.style.display='none';
});

closeButton.addEventListener('click',()=>{
    container.style.display='flex';
    container.style.display='none';
})

noticeModal.addEventListener('click',()=>{
	top_layer_assist.style.display='flex';
	noticeModal.style.display='none';
});

modalClose.addEventListener('click',()=>{
	top_layer_assist.style.display='flex';
	top_layer_assist.style.display='none';
});
