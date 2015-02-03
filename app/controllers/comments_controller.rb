	class CommentsController < ApplicationController
		def create
			post = get_post(params[:post_id])
			comment = post.comments.create(comment_params)
			respond_with post, comment
		end

		def upvote
			post = get_post(params[:post_id])
			comment = post.comments.find(params[:id])
			comment.increment!(:upvotes) # increment! increments AND saves the record

			respond_with post, comment
		end

		private
		def comment_params
			params.require(:comment).permit(:body, :upvotes)
		end

		def get_post(id)
			return Post.find(id)
		end
	end
