$(function(){

  function get_head_data(){
    $.ajax({
    url: '/projects/get_head_data',
    type: "GET",
    dataType: 'json',
    }).done(function(data){
      console.log('data');
      init_set_head_data(data);
    }).fail(function(){

    })
  }

  function init_set_head_data(data){
    // console.log(data[3].image.url);
    console.dir(data);
    $('#project1').append(buildHeadHTML(data[4-1]));
    $('#project2').append(buildHeadHTML(data[5-1]));
    $('#project3').append(buildHeadHTML(data[1-1]));
    $('#project4').append(buildHeadHTML(data[2-1]));
    $('#project5').append(buildHeadHTML(data[3-1]));
    $('#project6').append(buildHeadHTML(data[4-1]));
    $('#project7').append(buildHeadHTML(data[5-1]));
  }

  function buildHeadHTML(data){
    html = `<img src="${data.image.url}",class="top__contents__head-project-image">
            <div class="top__contents__head-project-recruitment_style">${data.recruitment_style}</div>
            <div class="top__contents__head-project-title">${data.title}</div>
           `

    return html;
  }

  get_head_data();
})