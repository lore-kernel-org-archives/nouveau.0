From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Subject: Re: Renouoveau hangs on 79th test on 8800 GT
Date: Sun, 8 Jun 2008 11:29:52 +0300
Message-ID: <20080608112952.0ff9415a@daedalus.pq.iki.fi>
References: <196947f20806070321jdbb037du67fd911278c2732@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <196947f20806070321jdbb037du67fd911278c2732-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: Aaron Whitehouse <lists-U0r1Rbd8+dlZj6j52QthyaVXKuFTiq87@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Sat, 7 Jun 2008 22:21:17 +1200
"Aaron Whitehouse" <lists-U0r1Rbd8+dlZj6j52QthyaVXKuFTiq87@public.gmane.org> wrote:

> Hello,
> 
> I am still trying to get you a dump from my brother's 8800 (because
> the dumps page says that you have never received one).

Hmm, I wonder if that page is updated. Or the list itself.

Nouveau people, could you clearly state the status of the renouveau dump
collection, so that I won't spread misinformation? I've lost track on
these things:
- Where are the correct dumps?
- Are the dumps automatically retrieved from gmail, parsed and uploaded?
- Is http://people.freedesktop.org/~jpakkane/ren/ up-to-date and is it
referring to the correct dump dir?

The Debian openssl hassle also casts confusion and somehow I don't trust
the wiki. Developers may think the renouveau dumps are not that
important currently, but they are still the best thing to contribute from
the point of view of the fans, so if there are problems with the
infrastructure, they should at least be clearly stated.

> The computer has a nVidia Corporation GeForce 8800 GT (rev a2) and I
> am running Koala's script.
> 
> It compiles and runs through most of the tests properly, but
> consistently hangs indefinitely on the 79th test until I press Ctrl+C
> and quit the program.

How long have you waited, max?

> The output is:
> 9/80 test_draw_buffer
> No Stereo context. Skipping stereo tests
> No double buffering. Skipping double buffer tests
> No GL_EXT_vertex_weighting extension.
> No GL_NV_texgen_emboss extension.
> GL_NV_vertex_program3 crashes up until driver 100.14.19 on G80 - skipping.
> 79/80 test_arb_vertex_buffer_object_indexed

Actually this is the test number 79, which is the 80th test (indexing
starts from 0 due to ummm... history! Yeah, historical reasons.)
So 79/80 can mean that all tests passed successfully, or that the last
test is hanging. Someone would be able to tell from the result file of
that test. It could be hanging on program exit, too, gdb would tell.

I was going to say it could also hang in test_interesting_regs() ran
after the normals tests, but that seems to be commented out currently.

Hm, right now someone else popped on the irc channel with the same hang.

-- 
Pekka Paalanen
http://www.iki.fi/pq/
