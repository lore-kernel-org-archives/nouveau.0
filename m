From: Ioannis Nousias <s0238762-Y3tGgqFSo3OFxr2TtlUqVg@public.gmane.org>
Subject: Re: Does Nouveau break the nVidia drivers?
Date: Fri, 13 Jul 2007 00:09:25 +0100
Message-ID: <4696B4A5.1090207@sms.ed.ac.uk>
References: <30c82f5f0707120641v45a01c72yb3a828271d1d64f9@mail.gmail.com>	
	<46965347.20005@sms.ed.ac.uk>	
	<30c82f5f0707121009o55e1c4dfo6c5a4cc4d7db51da@mail.gmail.com>	
	<469668BB.8030003@sms.ed.ac.uk>
	<30c82f5f0707121048o4453a2b6n57e752468ef7a2d2@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <30c82f5f0707121048o4453a2b6n57e752468ef7a2d2-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Louise Hoffman <louise.hoffman-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Louise Hoffman wrote:
>> Section "DRI"
>>        mode 666
>> EndSection
>>
>> and by 'loading' the glx and dri modules, I mean add these two in the
>> 'Section "Module"' of your xorg.conf:
>> Load   "glx"
>> Load   "dri"
>
> Thanks =)
>
>> As Richard said, it's a much more daunting task if you need the latest
>> nouveau drivers. And frankly, if you want to test anything useful, you
>> will need the new ones, since those that come with fedora are pretty old
>> and incomplete. They are missing the DRI part (nouveau_dri.so, part of
>> Mesa).
>
> So I can't try send dumps to Nouveau without breaking livna nVidia 
> drivers? =(
Probably not. Even though, the livna package keeps the nvidia libGL.so, 
libglx.so (and all other components that the official nvidia installer 
replaces) into separate directories 
('/usr/lib/xorg/modules/extensions/nvidia/' and '/usr/lib/nvidia/'), the 
problem is that you need to compile your own kernel (as Richard said). 
That means you can't use livna's package, since the kernel module it 
contains, is compiled against a specific kernel version.

Having said that, by keeping both kernels (always a good choice), in 
theory you could switch between your custom kernel with nouveau and the 
fedora kernel with the livna package. Also keep two copies of your 
xorg.conf for each setup and update the dynamic linker's bindings 
accordingly (as in the forum post). Haven't try this myself. If you have 
the time and don't mind messing around with your OS installation, give 
it a go and tell us if it works :-P

Something tells me I'm leading you to a 'dark place' ;)


-Ioannis
