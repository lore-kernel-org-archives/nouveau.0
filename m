From: "Maarten Maathuis" <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: TVout reverse engineering GF4 etc.
Date: Fri, 7 Dec 2007 19:47:07 +0100
Message-ID: <6d4bc9fc0712071047p3bc9bbc3hab7ee3509f351a48@mail.gmail.com>
References: <20071204090852.GA3938@feanor>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20071204090852.GA3938@feanor>
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
To: Dirk Thierbach <dthierbach-Mmb7MZpHnFY@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

TV-out is not high priority at the moment, but nevertheless, come to
our irc channel some time (#nouveau on freenode). It never hurts to
have a centralized place of development, especially when reverse
engineering is involved. Hope to see you soon.

Maarten.

On 12/4/07, Dirk Thierbach <dthierbach-Mmb7MZpHnFY@public.gmane.org> wrote:
> Hi,
>
> I read on http://nouveau.freedesktop.org/wiki/TestersWanted that
> you're looking for information for the integrated tvout
> functionality. I'm the author of nvtv, and I know some bits and pieces
> about that subject, so maybe we can pool efforts.
>
> The TV encoder used in the NVidia GPUs may be a Zoran CVE IP core,
>
> http://www.zoran.com/products/literature/index.html
>
> For the GF4 MX, it's possibly a CVE2, and for the newer cards, it may be
> one of the later versions. The Matrix G400 Maven TV encoder also seems to
> be a CVE2, but extended with extra registers.
>
> There's no register information on the CVE cores, but the Matrox people
> have figured out some of them, and I've guesses about some of the
> others.
>
> I've seen from the code at sourceforge that you've already found the
> index and data register for this core. The other registers in the 0x00d000
> area look like they are MUX control for the DACs, control for a scaler
> before the image is sent to the encoder (overscan, centering, flicker
> filter coefficients and vertical interpolation coefficients).
>
> All this is of course just guesswork, and some or all of it may be wrong.
>
> I'd appreciate it if one of you could point me to some place to
> document and exchange that information. If possible, I'd also like to have
> a look at any register dumps you have, especially for newer cards; maybe
> I am able to spot something.
>
> Finally, if any of you has such a card and access to a scope (unfortunately,
> I don't), it should be easy to verify the meaning of some of the encoder
> registers (and maybe to guess some more).
>
> - Dirk
>
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
>
