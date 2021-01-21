//
//  News.swift
//  AuthApp
//
//  Created by Михаил on 25.12.2020.
//

import UIKit



class NewsIdentity {
    var id: Int? = nil
    var user: User
    var text: String
    var photo: String
    var photoLikes: Int
    var newsLikes: Int
    var comments: [Comment] = []
    var forwardMessages: Int
    var looksForNews: Int
    var isLiked: Bool
    
    init(id:Int, user:User, text:String, photo:String, photoLikes: Int , newsLikes:Int, comments:[Comment], forwardMessages: Int, looksForNews: Int, isLiked: Bool) {
        self.id = id
        self.user = user
        self.text = text
        self.photo = photo
        self.photoLikes = photoLikes
        self.newsLikes = newsLikes
        self.comments = comments
        self.forwardMessages = forwardMessages
        self.looksForNews = looksForNews
        self.isLiked = isLiked
    }
    
}

class Comment {
    var id: Int
    var user: User
    var text: String
    var imgInside: UIImage?
    
    init(id:Int, user:User, text:String, imgInside: UIImage) {
        self.id = id
        self.user = user
        self.text = text
        self.imgInside = imgInside
}
}



class News  {
     
    var news = [NewsIdentity]()
    
    init() {
        setUp()
    }
    
    func setUp () {
        
        let news1 = NewsIdentity( id: 0, user: User(id: 0, image: "unnamed", name: "Вася", surname: "Крылов", photos: [UIImage(named: "face1")!], photoLikes: [2], isLiked: [false]),
                                 text: "Со́лнечная систе́ма — планетная система, включает в себя центральную звезду — Солнце — и все естественные космические объекты, вращающиеся вокруг Солнца. Она сформировалась путём гравитационного сжатия газопылевого облака примерно 4,57 млрд лет назад",
                                 photo: "sunsystem",
                                 photoLikes: 3,
                                 newsLikes: 5,
                                 comments: [Comment( id: 1,
                                                    user: User(id: 2, image: "photo11", name: "Елена",surname: "Смирнова", photos: [UIImage(named: "face3")!, UIImage(named: "face3pic1")!], photoLikes: [6,4], isLiked:[false,false]),
                                                        text: "Фото огонь!!!",
                                                        imgInside: UIImage(systemName:"heart.fill")!)],
                                 forwardMessages: 0,
                                 looksForNews: 0,
                                 isLiked: false
        )
        
        let news2 = NewsIdentity(id: 1, user: User(id: 2, image: "photo11", name: "Елена",surname: "Смирнова", photos: [UIImage(named: "face3")!, UIImage(named: "face3pic1")!], photoLikes: [6,4], isLiked:[false,false]  ),
                                text: "В Британии обнаружили новый штамм коронавируса: он на 70% более заразен. Из-за высокой скорости распространения вируса страны Европы начали закрывать авиасообщение с Британией.",
                                photo: "london",
                                photoLikes: 15,
                                newsLikes: 5,
                                comments: [Comment( id: 2,
                                                    user: User(id: 2, image: "photo11", name: "Елена",surname: "Смирнова", photos: [UIImage(named: "face3")!, UIImage(named: "face3pic1")!], photoLikes: [6,4], isLiked:[false,false]),
                                                    text: "Где это находится????", imgInside: UIImage(systemName:"heart.fill")!
                                                        ),
                                           Comment( id: 2,
                                                    user: User(id: 2, image: "photo11", name: "Елена",surname: "Смирнова", photos: [UIImage(named: "face3")!, UIImage(named: "face3pic1")!], photoLikes: [6,4], isLiked:[false,false]),
                                                    text: "Догадайся)))", imgInside: UIImage(systemName:"heart.fill")!
                                                        ),
                                ],
                                forwardMessages: 1,
                                looksForNews: 2,
                                isLiked: true
        )
        
        let news3 = NewsIdentity(id: 2, user: User(id: 2, image: "photo11", name: "Елена",surname: "Смирнова", photos: [UIImage(named: "face3")!, UIImage(named: "face3pic1")!], photoLikes: [6,4], isLiked: [false,false]  ),
                                text: "Италия – удивительная страна, в которой переплелись история и современность, различные эпохи и богатое культурное наследие, традиции и самобытность. Памятники старины времен Рима, очаровывающая романтика Венеции, холмистая панорама Тосканы, южные склоны Альп, чудесная природа, солнце, море, воздух – всё это Италия! Имеющая уникальное географическое расположение в центральной части Средиземноморья, она стала колыбелью европейской цивилизации. Здесь, на Апеннинах, зародилась древняя Римская империя, давшая миру знаменитых ученых, талантливых художников и самое большое число достопримечательностей, составивших золотой фонд Всемирного наследия ЮНЕСКО.",
                                photo: "garda",
                                photoLikes: 15,
                                newsLikes: 61,
                                comments: [Comment( id: 3,
                                                    user: User(id: 2, image: "photo11", name: "Елена",surname: "Смирнова", photos: [UIImage(named: "face3")!, UIImage(named: "face3pic1")!], photoLikes: [6,4], isLiked:[false,false]),
                                                    text: "super goooood", imgInside: UIImage(systemName:"heart.fill")!
                                                        ),
                                           Comment( id: 4,
                                                    user: User(id: 2, image: "photo11", name: "Елена",surname: "Смирнова", photos: [UIImage(named: "face3")!, UIImage(named: "face3pic1")!], photoLikes: [6,4], isLiked:[false,false]),
                                                    text: "=)", imgInside: UIImage(systemName:"heart.fill")!
                                                        )
                                ],
                                forwardMessages: 11,
                                looksForNews: 15,
                                isLiked: false
        )
        
        let news4 = NewsIdentity(id: 3, user: User(id: 2, image: "photo11", name: "Елена",surname: "Смирнова", photos: [UIImage(named: "face3")!, UIImage(named: "face3pic1")!], photoLikes: [6,4], isLiked: [false,false]  ),
                                text: "Италию населяет замечательный народ, известный своим горячим южным темпераментом, открытостью, радушием, удивительной общительностью, непринужденностью и гостеприимством. Кто-то метко подметил, что каждый итальянец – это «театр одного актера», подразумевая, что жителям страны присущи индивидуальность, свободный стиль в одежде, неповторимая жестикуляция, эмоциональность. Кажется, что итальянцы абсолютно свободны и делают только то, что им нравится. И стоит ли удивляться, что сюда, на юг Европы, туристов притягивает словно магнитом. Для путешественников в Италии есть всё, что только душа пожелает: обилие интересных мест, отличные пляжи, великолепные трассы, разнообразная и бесподобно вкусная кухня. ",
                                photo: "italy",
                                photoLikes: 15,
                                newsLikes: 3,
                                comments: [Comment( id: 1,
                                                    user: User(id: 2, image: "photo11", name: "Елена",surname: "Смирнова", photos: [UIImage(named: "face3")!, UIImage(named: "face3pic1")!], photoLikes: [6,4], isLiked:[false,false]),
                                                        text: "Не верю)",
                                                        imgInside: UIImage(systemName:"heart.fill")!)],
                                forwardMessages: 2,
                                looksForNews: 11,
                                isLiked: false
        )
        
        
        news.append(news1)
        news.append(news2)
        news.append(news3)
        news.append(news4)
        
        
    }
    
    
}

