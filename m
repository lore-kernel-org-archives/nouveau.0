From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: Direct Firmware load error
Date: Tue, 9 Sep 2014 15:09:42 -0400
Message-ID: <CAKb7Uvg2ETvhtKY-1+uWmxYMm7mWYJwTTD2CsNwJBTA9aN_q5Q@mail.gmail.com>
References: <20140909200827.67784613@7-of-9>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20140909200827.67784613@7-of-9>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: pete nikolic <pg.nikolic1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Tue, Sep 9, 2014 at 3:08 PM, pete nikolic <pg.nikolic1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
> Hi Folks
>
> Getting a considerable number of these showing up  at the moment
>
>
> [  619.350185] nouveau 0000:01:00.0: Direct firmware load failed with error -2
> [  619.350193] nouveau 0000:01:00.0: Falling back to user helper
> [  619.352536] nouveau 0000:01:00.0: Direct firmware load failed with error -2
> [  619.352543] nouveau 0000:01:00.0: Falling back to user helper
> [  619.354243] nouveau E[    PBSP][0000:01:00.0] unable to load firmware data
> [  619.354253] nouveau E[    PBSP][0000:01:00.0] init failed, -12

This is from the video decoding acceleration unit. See
http://nouveau.freedesktop.org/wiki/VideoAcceleration/ for more info.
Long story short, if you want to use vdpau, you need the firmware.

  -ilia
