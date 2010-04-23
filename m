From: Xavier Chantry <chantry.xavier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Mesa-dev] drm-nouveau - more gl extensions?
Date: Fri, 23 Apr 2010 11:04:40 +0200
Message-ID: <u2pb67489df1004230204kb101c8d7na2721b2e9779ed5b@mail.gmail.com>
References: <4BD02BA9.20406@interia.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <4BD02BA9.20406-khu2bkKidpXVItvQsEIGlw@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: yaiba.kurogane-khu2bkKidpXVItvQsEIGlw@public.gmane.org
Cc: nouveau <Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Thu, Apr 22, 2010 at 12:57 PM,  <yaiba.kurogane-khu2bkKidpXVItvQsEIGlw@public.gmane.org> wrote:
> Hello. I have old nvidia hardware (NV17) and noticed that some extensions
> are missing.They will be added in near future ? Anyone from nouveau
> developers actually working on driver for such old hw ???

A few months ago :
15:27 < curro_> hmm, or we could expose gl1.3 already, IIRC the only
thing left is cube mapping

curro is the one that resurrected the nv10-nv20 driver and got it to a
nicer state.
He seemed less active recently, so probably busy with other things
like work and/or life.

I guess it depends on what extension / what gl version you are talking
about and how complex they are to implement.
And I suppose they are all supported by the blob (nvidia proprietary driver) ?
