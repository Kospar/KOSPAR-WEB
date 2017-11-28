CREATE TABLE "schema_migrations" ("version" varchar NOT NULL);
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
CREATE TABLE "users" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "email" varchar DEFAULT '' NOT NULL, "name" varchar DEFAULT '' NOT NULL, "nickname" varchar DEFAULT '' NOT NULL, "admin" boolean, "company_name" varchar, "company_private" boolean, "company_address" varchar, "company_address_details" varchar, "company_address_extra_info" varchar, "company_address_post_num" varchar, "company_tel_num_1" varchar, "company_tel_num_2" varchar, "company_tel_num_3" varchar, "encrypted_password" varchar DEFAULT '' NOT NULL, "reset_password_token" varchar, "reset_password_sent_at" datetime, "remember_created_at" datetime, "sign_in_count" integer DEFAULT 0 NOT NULL, "current_sign_in_at" datetime, "last_sign_in_at" datetime, "current_sign_in_ip" varchar, "last_sign_in_ip" varchar, "confirmation_token" varchar, "confirmed_at" datetime, "confirmation_sent_at" datetime, "unconfirmed_email" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE UNIQUE INDEX "index_users_on_email" ON "users" ("email");
CREATE UNIQUE INDEX "index_users_on_nickname" ON "users" ("nickname");
CREATE UNIQUE INDEX "index_users_on_reset_password_token" ON "users" ("reset_password_token");
CREATE TABLE "images" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "alt" varchar, "hint" varchar, "file" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "qnas" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "title" varchar, "category" varchar, "content" text, "image" varchar, "reply_id" integer, "user_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "answer" boolean);
CREATE INDEX "index_qnas_on_reply_id" ON "qnas" ("reply_id");
CREATE INDEX "index_qnas_on_user_id" ON "qnas" ("user_id");
CREATE TABLE "trends" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "title" varchar, "category" varchar, "content" text, "user_id" integer, "files" json, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE INDEX "index_trends_on_user_id" ON "trends" ("user_id");
CREATE TABLE "replies" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "title" varchar, "content" text, "image" varchar, "user_id" integer, "qna_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE INDEX "index_replies_on_user_id" ON "replies" ("user_id");
CREATE INDEX "index_replies_on_qna_id" ON "replies" ("qna_id");
CREATE TABLE "design_documents" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "title" varchar, "content" text, "user_id" integer, "files" json, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE INDEX "index_design_documents_on_user_id" ON "design_documents" ("user_id");
CREATE TABLE "doc_comments" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "content" varchar, "user_id" integer, "design_document_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE INDEX "index_doc_comments_on_user_id" ON "doc_comments" ("user_id");
CREATE INDEX "index_doc_comments_on_design_document_id" ON "doc_comments" ("design_document_id");
CREATE TABLE "opensrcs" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "title" varchar, "content" text, "github" varchar, "user_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE INDEX "index_opensrcs_on_user_id" ON "opensrcs" ("user_id");
CREATE TABLE "open_comments" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "content" varchar, "user_id" integer, "opensrc_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE INDEX "index_open_comments_on_user_id" ON "open_comments" ("user_id");
CREATE INDEX "index_open_comments_on_opensrc_id" ON "open_comments" ("opensrc_id");
CREATE TABLE "abouts" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "content" text, "user_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE INDEX "index_abouts_on_user_id" ON "abouts" ("user_id");
CREATE TABLE "forum_boards" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "subject" varchar, "user_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE INDEX "index_forum_boards_on_user_id" ON "forum_boards" ("user_id");
CREATE TABLE "notices" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "title" varchar, "startDate" varchar, "endDate" varchar, "address" varchar, "y_location" float, "x_location" float, "content" text, "user_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE INDEX "index_notices_on_user_id" ON "notices" ("user_id");
CREATE TABLE "forum_posts" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "title" varchar, "content" text, "user_id" integer, "forum_board_id" integer, "files" json, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE INDEX "index_forum_posts_on_user_id" ON "forum_posts" ("user_id");
CREATE INDEX "index_forum_posts_on_forum_board_id" ON "forum_posts" ("forum_board_id");
CREATE TABLE "forum_comments" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "content" text, "user_id" integer, "forum_post_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE INDEX "index_forum_comments_on_user_id" ON "forum_comments" ("user_id");
CREATE INDEX "index_forum_comments_on_forum_post_id" ON "forum_comments" ("forum_post_id");
CREATE TABLE "admin_users" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "email" varchar DEFAULT '' NOT NULL, "encrypted_password" varchar DEFAULT '' NOT NULL, "reset_password_token" varchar, "reset_password_sent_at" datetime, "remember_created_at" datetime, "sign_in_count" integer DEFAULT 0 NOT NULL, "current_sign_in_at" datetime, "last_sign_in_at" datetime, "current_sign_in_ip" varchar, "last_sign_in_ip" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE UNIQUE INDEX "index_admin_users_on_email" ON "admin_users" ("email");
CREATE UNIQUE INDEX "index_admin_users_on_reset_password_token" ON "admin_users" ("reset_password_token");
CREATE TABLE "active_admin_comments" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "namespace" varchar, "body" text, "resource_id" integer, "resource_type" varchar, "author_id" integer, "author_type" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE INDEX "index_active_admin_comments_on_namespace" ON "active_admin_comments" ("namespace");
CREATE INDEX "index_active_admin_comments_on_author_type_and_author_id" ON "active_admin_comments" ("author_type", "author_id");
CREATE INDEX "index_active_admin_comments_on_resource_type_and_resource_id" ON "active_admin_comments" ("resource_type", "resource_id");
INSERT INTO schema_migrations (version) VALUES ('20170914120653');

INSERT INTO schema_migrations (version) VALUES ('20171007162725');

INSERT INTO schema_migrations (version) VALUES ('20171017094324');

INSERT INTO schema_migrations (version) VALUES ('20171028102517');

INSERT INTO schema_migrations (version) VALUES ('20171028172011');

INSERT INTO schema_migrations (version) VALUES ('20171029105050');

INSERT INTO schema_migrations (version) VALUES ('20171030183019');

INSERT INTO schema_migrations (version) VALUES ('20171031001431');

INSERT INTO schema_migrations (version) VALUES ('20171031091448');

INSERT INTO schema_migrations (version) VALUES ('20171031092239');

INSERT INTO schema_migrations (version) VALUES ('20171106123124');

INSERT INTO schema_migrations (version) VALUES ('20171106131304');

INSERT INTO schema_migrations (version) VALUES ('20171106193059');

INSERT INTO schema_migrations (version) VALUES ('20171111063059');

INSERT INTO schema_migrations (version) VALUES ('20171111123106');

INSERT INTO schema_migrations (version) VALUES ('20171125092229');

INSERT INTO schema_migrations (version) VALUES ('20171125092239');

