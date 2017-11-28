# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
for i in 1..5
    ForumBoard.create(
        subject: "Autosar_#{i}",
        user_id:1,
    )
end
for i in 1..50
    Qna.create(
        title: "#{i}번 글입니다.",
        category: "Autosar",
        answer: false,
        content: "안녕하세요 안녕하세요 안녕하세요 안녕하세요 안녕하세요 안녕하세요 안녕하세요 안녕하세요 안녕하세요 ",
        user_id:1
    )
end
for i in 1..50
    DesignDocument.create(
        title: "#{i}번 글입니다.",
        content: "안녕하세요 안녕하세요 안녕하세요 안녕하세요 안녕하세요 안녕하세요 안녕하세요 안녕하세요 안녕하세요 ",
        user_id:2
    )
end
for i in 1..50
    Opensrc.create(
        title: "#{i}번 글입니다.",
        content: "안녕하세요 안녕하세요 안녕하세요 안녕하세요 안녕하세요 안녕하세요 안녕하세요 안녕하세요 안녕하세요 ",
        user_id:2,
        github:"https://www.naver.com"
    )
end
for i in 1..50
    ForumPost.create(
        title: "#{i}번 글입니다.",
        content: "안녕하세요 안녕하세요 안녕하세요 안녕하세요 안녕하세요 안녕하세요 안녕하세요 안녕하세요 안녕하세요 ",
        user_id:2,
        forum_board_id:1
    )
    ForumPost.create(
        title: "#{i}번 글입니다.",
        content: "안녕하세요 안녕하세요 안녕하세요 안녕하세요 안녕하세요 안녕하세요 안녕하세요 안녕하세요 안녕하세요 ",
        user_id:2,
        forum_board_id:2
    )
    ForumPost.create(
        title: "#{i}번 글입니다.",
        content: "안녕하세요 안녕하세요 안녕하세요 안녕하세요 안녕하세요 안녕하세요 안녕하세요 안녕하세요 안녕하세요 ",
        user_id:2,
        forum_board_id:3
    )
    ForumPost.create(
        title: "#{i}번 글입니다.",
        content: "안녕하세요 안녕하세요 안녕하세요 안녕하세요 안녕하세요 안녕하세요 안녕하세요 안녕하세요 안녕하세요 ",
        user_id:2,
        forum_board_id:4
    )
    ForumPost.create(
        title: "#{i}번 글입니다.",
        content: "안녕하세요 안녕하세요 안녕하세요 안녕하세요 안녕하세요 안녕하세요 안녕하세요 안녕하세요 안녕하세요 ",
        user_id:2,
        forum_board_id:5
    )
end
for i in 51..100
    Qna.create(
        title: "#{i}번 글입니다.",
        category: "category_2",
        content: "안녕하세요 안녕하세요 안녕하세요 안녕하세요 안녕하세요 안녕하세요 안녕하세요 안녕하세요 안녕하세요 ",
        answer: false,
        user_id:1
    )
end

for i in 1..100
    Trend.create(
        title: "자율주행의 모듯것 #{i}",
        category: "latest",
        user_id: 1,
        content:    "<p>111</p>
                    <p>오늘은 최신 기술에 대해서 소개해드리려고 합니다.</p>
                    
                    <p>자율주행의 핵심이 무엇일까요? 바로 ㅁㄴㅇㄹㅁㄴㅇㄹㄴㅇㅁㄹㅁㄴㅇㄹㅁㄴ</p>
                    
                    <p>111</p>
                    <p>오늘은 최신 기술에 대해서 소개해드리려고 합니다.</p>
                    
                    <p>자율주행의 핵심이 무엇일까요? 바로 ㅁㄴㅇㄹㅁㄴㅇㄹㄴㅇㅁㄹㅁㄴㅇㄹㅁㄴ</p>
                    
                    <p>111</p>
                    <p>오늘은 최신 기술에 대해서 소개해드리려고 합니다.</p>
                    
                    <p>자율주행의 핵심이 무엇일까요? 바로 ㅁㄴㅇㄹㅁㄴㅇㄹㄴㅇㅁㄹㅁㄴㅇㄹㅁㄴ</p>"
    )
end
# AdminUser.create!(email: 'admin@kospar.org', password: 'kospar12!', password_confirmation: 'kospar12!')
# 