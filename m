From: "Stephane Marchesin" <marchesin-YynmYXH4S6491FlJP1ih0VAUjnlXr6A1@public.gmane.org>
Subject: Re: NV86 (Quadro NVS 140M) errors in dmesg
Date: Sat, 2 Aug 2008 05:03:05 +0200
Message-ID: <6a89f9d50808012003j13bca34eg358b0b0f39626242@mail.gmail.com>
References: <1217629252.3619.5.camel@luna.unix.geek.nz>
	<1217635362.10309.2.camel@araqiel>
	<1217640709.3619.12.camel@luna.unix.geek.nz>
	<6a89f9d50808011910g560e2953p374d48829e240b6b@mail.gmail.com>
	<1217643398.3619.16.camel@luna.unix.geek.nz>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1217643398.3619.16.camel-UfQkq/qJUt3chhi/u/9I76VXKuFTiq87@public.gmane.org>
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
To: Jasper Bryant-Greene <jasper-XrxwZhJB1KNIJsTUW+i+0g@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On 8/2/08, Jasper Bryant-Greene <jasper-XrxwZhJB1KNIJsTUW+i+0g@public.gmane.org> wrote:
> On Sat, 2008-08-02 at 04:10 +0200, Stephane Marchesin wrote:
>  > On 8/2/08, Jasper Bryant-Greene <jasper-XrxwZhJB1KNIJsTUW+i+0g@public.gmane.org> wrote:
>
> > >  Also, is there any way to force the DPI with nouveau? [snip]
>
>
>  > Your panel size should be reported in the X.Org log, check that it is correct.
>
>
> Yes, it is reported correctly in the Xorg log. The nvidia binary driver
>  also reports it correctly, and has the same bug with DPI unless I
>  specify 'Option DPI "96 x 96"' under Device in xorg.conf.
>
>  (**) NOUVEAU(0): Display dimensions: (330, 210) mm
>

Interesting, it seems the DPI is computed for a 1680x1680 video mode.
The size is the one used in case you use desktop rotation, but it
shouldn't be used for DPI computation.

Stephane
