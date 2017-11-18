$(function(){

  function get_head_data(){
    $.ajax({
    url: '/projects/get_head_data',
    type: "GET",
    dataType: 'json',
    }).done(function(data){
      console.log(data);
      init_set_head_data(data);
      $('.top__contents').slick({
        infinite: true,
        centerMode: true,
        centerPadding: '300px',
        slidesToShow: 1,
        variableWidth: true,
        // autoplay: true,
        autoplaySpeed: 3500,
        dots: true,
        appendArrows: $('#arrows'),
        appendDots: $('.my-dots')
      });
    }).fail(function(){
    })
  }

  function init_set_head_data(data){
    $('#project1').append(buildHeadHTML(data[4-1]));
    $('#project2').append(buildHeadHTML(data[5-1]));
    $('#project3').append(buildHeadHTML(data[1-1]));
    $('#project4').append(buildHeadHTML(data[2-1]));
    $('#project5').append(buildHeadHTML(data[3-1]));
  }

  function buildHeadHTML(data){
    html = `<img src="${data.image.url}" class="top__contents__head-project-image">
            <div class="top__contents__head-project-recruitment_style">${data.recruitment_style}</div>
            <div class="top__contents__head-project-title">${data.title}</div>
            <img src="${data.company_icon.url}" class="top__contents__head-project-company-icon">
            <div class="top__contents__head-project-company-name">${data.company_name}</div>
            <img src="assets/like.png" class="top__contents__head-project-like">
           `
    return html;
  }

  function set_init_position(){
    var window_width = $(window).width();
    var left_width = (1287 - (window_width - 640) /2 ) * -1;
    $('.top__contents').css('left', left_width);
    console.log(left_width);
  };

  get_head_data();
  $(document).on('click','.dot',  function(){
    console.log('dot!');
    $('.top__contents').slick('slickGoTo', 3);
  })

})
