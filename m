From: "Emil Velikov" <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: NVS 4200M support
Date: Tue, 06 Dec 2011 21:00:53 -0000
Message-ID: <op.v525koi38t7z9u@arch-laptop>
References: <4EDE76BD.9000502@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"; DelSp="yes"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <4EDE76BD.9000502-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: "Dmitry A. Ashkadov" <dmitry.ashkadov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Tue, 06 Dec 2011 20:10:37 -0000, Dmitry A. Ashkadov  
<dmitry.ashkadov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> Hello!
>
> I have Nvidia NVS 4200M installed on my laptop. Does nouveau support it?
> If I change video to Discrete card in BIOS, then nouveau (version  
> 0.0.16) logs:
>> nouveau: probe of 0000:01:00.0 failed with error -22
> and
>> [drm] failed to open device
>> No devices detected
>
> Thank you!

Hello Dmitry

The card mentioned is supported (as of kernel 3.2), although your  
experience may vary

Can you please try kernel 3.2 or nouveau development tree [1]
Take a note that external firmware is required [2]

Any further problems please feel free to file a bugreport [3]


Thanks

[1] http://cgit.freedesktop.org/nouveau/linux-2.6/
[2] http://nouveau.freedesktop.org/wiki/InstallDRM#Firmware
[3] http://nouveau.freedesktop.org/wiki/Bugs

>
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
