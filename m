From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: NV50 backlight brightness
Date: Fri, 22 Oct 2010 21:17:37 +1000
Message-ID: <FC457B53-D6EF-48DC-BB56-F2FAC3D84577@gmail.com>
References: <20101019091030.GA28588@aeneby.se>
	<1287573459.24955.11.camel@araqiel>
	<20101021091621.GA29567@aeneby.se>
	<1287657920.3245.1.camel@nisroch>
	<20101022095740.GA30072@aeneby.se>
Mime-Version: 1.0 (iPhone Mail 8B117)
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20101022095740.GA30072-+1tCnOwpXBmzQB+pC5nmwQ@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Aaron Sowry <aaron+nv-+1tCnOwpXBmzQB+pC5nmwQ@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org



Sent from my iPhone

On 22/10/2010, at 19:57, Aaron Sowry <aaron+nv-+1tCnOwpXBmzQB+pC5nmwQ@public.gmane.org> wrote:

> On Thu, Oct 21, 2010 at 08:45:20PM +1000, Ben Skeggs wrote:
>> What value does 0x610084 contain on boot for you?
>> 
> Using the attached patch (hopefully early enough on in the initialisation):
> 
> [aaron@jules ~]$ dmesg | grep NV50
> [drm] nouveau 0000:01:00.0: Detected an NV50 generation card (0x0a8600a2)
> NV50 0x00610084: 0xa0000000
> 
> What's the relevance of this value?
Oops, nothing, that was a typo. 0x61c084 is what I meant :)

> <reg_peek.patch>
