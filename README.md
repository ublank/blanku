##API Routes (Question Cards)

Verb   |  URI Pattern                   | Controller#Action
-------|--------------------------------|---------------------------
GET    | /api/question_cards            | api/question_cards#index
POST   | /api/question_cards            | api/question_cards#create
GET    | /api/question_cards/new        | api/question_cards#new
GET    | /api/question_cards/:id/edit   | api/question_cards#edit
GET    | /api/question_cards/:id        | api/question_cards#show
PATCH  | /api/question_cards/:id        | api/question_cards#update
PUT    | /api/question_cards/:id        | api/question_cards#update
DELETE | /api/question_cards/:id        | api/question_cards#destroy



##API Routes (Answer Cards)

Verb   |  URI Pattern                                                |  Controller#Action
-------|-------------------------------------------------------------|---------------------------
GET    | /api/question_cards/:question_card_id/answer_cards          | api/answer_cards#index
POST   | /api/question_cards/:question_card_id/answer_cards          | api/answer_cards#create
GET    | /api/question_cards/:question_card_id/answer_cards/new      | api/answer_cards#new
GET    | /api/question_cards/:question_card_id/answer_cards/:id/edit | api/answer_cards#edit
GET    | /api/question_cards/:question_card_id/answer_cards/:id      | api/answer_cards#show
PATCH  | /api/question_cards/:question_card_id/answer_cards/:id      | api/answer_cards#update
PUT    | /api/question_cards/:question_card_id/answer_cards/:id      | api/answer_cards#update
DELETE | /api/question_cards/:question_card_id/answer_cards/:id      | api/answer_cards#destroy




