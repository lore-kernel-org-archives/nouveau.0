From: Javier Domingo <javierdo1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: GTX-560 in v3.6
Date: Mon, 3 Dec 2012 02:22:48 +0100
Message-ID: <CALZVapmMf1AotMRLuv=ZOhgFOOJMz+K4HsCERMze1nGWHdSkSQ@mail.gmail.com>
References: <CALZVap=00ePY-ooV1zAa5OUsFGhmafvtaOJ0SiRhJmb5TmAqgQ@mail.gmail.com>
	<20121201191027.GA5139@joi.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20121201191027.GA5139-OI9uyE9O0yo@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

I found that I hadn't compile my kernel with drm nor nouveau. Now it
is running smoothly in v3.6.
Javier Domingo


2012/12/1 Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:
> On Thu, Nov 29, 2012 at 11:56:54AM +0100, Javier Domingo wrote:
>> Hi,
>>
>> I am running a GTX-560 with nouveau driver, or at least I try to, and
>> I dont get it working... I have seen that in the Xorg.log.0 appears
>> the chipset family, but I don't know why it isn't working.
>>
>> I attach the Xorg.log.0 and the dmesg output,
>
> http://nouveau.freedesktop.org/wiki/TroubleShooting#Xorg_fails_to_start_with_.22.28EE.29_.5Bdrm.5D_failed_to_open_device.22
