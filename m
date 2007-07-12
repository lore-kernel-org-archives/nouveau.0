From: Ioannis Nousias <s0238762-Y3tGgqFSo3OFxr2TtlUqVg@public.gmane.org>
Subject: Re: Does Nouveau break the nVidia drivers?
Date: Thu, 12 Jul 2007 18:45:31 +0100
Message-ID: <469668BB.8030003@sms.ed.ac.uk>
References: <30c82f5f0707120641v45a01c72yb3a828271d1d64f9@mail.gmail.com>	
	<46965347.20005@sms.ed.ac.uk>
	<30c82f5f0707121009o55e1c4dfo6c5a4cc4d7db51da@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <30c82f5f0707121009o55e1c4dfo6c5a4cc4d7db51da-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
>> Yes you can have the nVidia binary drivers and nouveau at the same time,
>> as long as you use the livna packages:
>>
>> check this post
>> http://forums.fedoraforum.org/showpost.php?p=810199&postcount=12
>
> What does he mean by "setting the dri permissions"?
>
> "do the usual changes to xorg.conf file, like changing the driver,
> loading glx and dri and setting the dri permissions."
what I mean is add something like this in your xorg.conf:

Section "DRI"
       mode 666
EndSection

and by 'loading' the glx and dri modules, I mean add these two in the 
'Section "Module"' of your xorg.conf:
Load   "glx"
Load   "dri"


I think the new server loads these by default anyway.

As Richard said, it's a much more daunting task if you need the latest 
nouveau drivers. And frankly, if you want to test anything useful, you 
will need the new ones, since those that come with fedora are pretty old 
and incomplete. They are missing the DRI part (nouveau_dri.so, part of 
Mesa).
