From: Jack <ostroffjh-rphTv4pjVZMJGwgDXS7ZQA@public.gmane.org>
Subject: missing text and icons with NV25
Date: Wed, 23 Dec 2009 18:29:03 -0500
Message-ID: <1261610943.15419.0@ffortso4>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Hello,

I'm using nouveau xf86-video-nouveau 0.0.10_git20091101-1 and  
nouveau-drm 0.0.15_20091120-1 under Arch Linux with xorg-server  
1.7.3.901-1.  My video card is recognized as "nVidia Corporation NV25GL  
[Quadro4 750 XGL]".

X starts (with no apparent errors) but it's essentially unusable, since  
it's missing all the icons on all the panels and toolbars, and no text  
shows up at all.  For example, I can start an xterm, since I know where  
the icon is on the panel, and I can type commands, which by the cursor  
movement seem to be working correctly, but there is no visible text in  
the term.  Popups (such as right-clicking on the main window) have some  
clutter/video noise - but no text or icons.  I see no obvious error  
messages in the log or dmesg.

This seems similar to the report in Bug 14092  
(https://bugs.freedesktop.org/show_bug.cgi?id=14092) but that was from  
March 2008, so I figure the fix would be in the version I'm running.

If this is a known issue, feel free to point me to the documentation  
I've obviously missed.  Otherwise, what else should I post to assist  
with troubleshooting?  (I'll defer posting even xorg.conf and the Xorg  
log until someone claims they will be of use.)

Thanks for any suggestions or assistance.

Jack
