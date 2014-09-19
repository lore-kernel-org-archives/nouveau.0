From: =?UTF-8?B?T3J0d2luIEdsw7xjaw==?= <odi-L693kI9kcNY@public.gmane.org>
Subject: Re: [BUG] nouveau regression: ext monitor dead after
	resume
Date: Fri, 19 Sep 2014 16:41:46 +0200
Message-ID: <541C40AA.4060206@odi.ch>
References: <541AE737.8070009@odi.ch>
 <CAKb7UvjcYsFm7TWzKXdWHVDVRDO1rFtcCTZoChYssDKqLMDGWw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAKb7UvjcYsFm7TWzKXdWHVDVRDO1rFtcCTZoChYssDKqLMDGWw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org



On 18.09.2014 16:58, Ilia Mirkin wrote:
> This has been reported a few times already -- probably the same thing
> as bug https://bugs.freedesktop.org/show_bug.cgi?id=83550

Ah, thanks. I would like to try with that commit reverted, but unfortunately it no longer reverts
cleanly, and my attempts to make a sensible merge were futile. If you can send me a patch that
reverts the changes on 3.17-rc5 or 3.16 I am glad to try it out and give you the requested feedback.

Ortwin
