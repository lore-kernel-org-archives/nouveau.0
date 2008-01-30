From: Roel Kluin <12o3l-IWqWACnzNjzz+pZb47iToQ@public.gmane.org>
Subject: Re: [PATCH] free nvs->pass_rec on error in
 nouveau_shader_pass2(), nouveau_shader_2.c
Date: Wed, 30 Jan 2008 12:34:49 +0100
Message-ID: <47A060D9.9030800@tiscali.nl>
References: <479FBD2B.3020309@tiscali.nl>
	<6a89f9d50801291636j32cb1e39j79c4a921b3c3a9d2@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <6a89f9d50801291636j32cb1e39j79c4a921b3c3a9d2-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Stephane Marchesin <marchesin-YynmYXH4S6491FlJP1ih0VAUjnlXr6A1@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Stephane Marchesin wrote:
> Hi Roel,
> 
> All your patches correct valid flaws. However, as you might have
> noticed, the old DRI code doesn't see much development at the moment.
> The reason is that we've decided to jump in the gallium3D wagon before
> it was even finished. So you have to know that this piece of code is
> currently not maintained, and that you'd have to finish it by yourself
> mostly.
> 
> I can of course push your patches if you feel like actually working on
> finishing this old-scheme DRI driver. Just tell me.
> 
> Stephane

Thanks for your information. I'll focus on gallium3D development instead.
However, since my patches correct valid flaws, maybe it's best to push
these patches. Is it a lot of work? If not, please do.

Chances are that someone in the future copy/pastes code, and with that
these flaws, or that at a later time it is decided that the original
driver was the better.

Roel Kluin
