From: Xavier Chantry <chantry.xavier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: swap control
Date: Fri, 29 Jan 2010 12:11:24 +0100
Message-ID: <b67489df1001290311t753b9d12wb47a1f503e9ccda7@mail.gmail.com>
References: <b67489df1001290107v43d29388paaa7f1d939d16073@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <b67489df1001290107v43d29388paaa7f1d939d16073-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau <Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Fri, Jan 29, 2010 at 10:07 AM, Xavier Chantry
<chantry.xavier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Is it possible to use sync to vblank / swap control with mesa/gallium
> (and nouveau) ?

I already have the answer to the primary question, thanks curro !

11:39 < curro__> shining: yes, gallium drivers can sync to vblank, but
we aren't implementing that yet.
11:40 -!- curro__ is now known as curro_
11:40 < shining> nouveau gallium doesnt ?
11:40 < shining> is it hard to implement ?
11:41 < curro_> shining: nope, we already sync to vblank in the Xv code
11:41 < shining> right, so its the same code we just have to copy
11:42 < shining> is this a wanted feature ?
11:43 < shining> I am curious if I could play teeworlds at less than
100% cpu :) it runs really great on my
                 laptop nv84, 100-200 fps, but it gets hot and noisy.
11:45 < shining> anyway, even if its not too hard, its still too hard
for me, I am not even able to locate the
                 relevant code. what a mess between
opengl/mesa/dri1/dri2/gallium code
11:56 < curro_> shining: well, i'd also blame the fence busy-waiting
we do instead of putting the process to
                sleep
