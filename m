From: "Stephane Marchesin" <marchesin-YynmYXH4S6491FlJP1ih0VAUjnlXr6A1@public.gmane.org>
Subject: Re: GSOC '08 hardware accelerated video decoding
Date: Sun, 23 Mar 2008 13:11:26 +0100
Message-ID: <6a89f9d50803230511r298fe390u880195765e0ab59c@mail.gmail.com>
References: <586c2acd0803201155o6f33112ay4ce8421f979068f7@mail.gmail.com>
	<6a89f9d50803201721g3d05ef47q98cb261838c03435@mail.gmail.com>
	<586c2acd0803221925q131e74c4tc83167563fc30e48@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <586c2acd0803221925q131e74c4tc83167563fc30e48-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Younes M <younes.m-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On 3/23/08, Younes M <younes.m-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hi Stephane,
>
>  Thanks for your thoughts. I assume you mean doing the MC and CSC steps
>  using shaders. I'm not familiar enough with nouveau at the moment to
>  know whether or not it's complete enough to do the above, it seems
>  like we need vertex and pixel shaders, texturing, and render target
>  support.

Yes, MC and CSC can for sure be done with shaders (we actually already
do CSC using shaders for Xv on nv30/nv40 ATM).

But I don't think that's the only stages we want to implement. Things
like idct can also be done with shaders. In fact, except for entropy
encoding (cabac, cabvlc, huffman) I'm quite confident that the whole
pipeline can be put on the GPU. FWIW, newer nvidia GPUs do not even
have a fixed pipe for video decoding any more, and do it with shaders
(except for the entropy decoding, which has a dedicated hardware
unit).

>
>  As I mentioned before, I only have access to an NV30 at the moment (it
>  looks like NV40 is the farthest along). I may look into getting an
>  NV40 card if nouveau is far enough along to implement XvMC or VAAPI in
>  terms of gallium3D.
>

NV40 might be easier, but you'll probably have to fix things on the
driver side in any case.

Stephane
