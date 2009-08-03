From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 17377] NV50 failure on MacBook Pro.
Date: Mon,  3 Aug 2009 04:50:04 -0700 (PDT)
Message-ID: <20090803115005.1E6E8130058@annarchy.freedesktop.org>
References: <bug-17377-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-17377-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=17377





--- Comment #14 from schmirrwurst-GANU6spQydw@public.gmane.org  2009-08-03 04:50:04 PST ---
The behaviour have changed a little bit with the following version :
ii  libdrm-nouveau1                     
2.4.12+git20090801.45078630-0ubuntu0sarvatt2 Userspace interface to
nouveau-specific kern
ii  nouveau-kernel-source                0.0.14+git20090730-0~9.10~ppa1        
      DKMS source for the nouveau kernel modules
ii  xserver-xorg-video-nouveau          
1:0.0.10~git+20090730+9b37bc9-0~9.10~ppa1 

Now I often have a grey screen with a lot of colored pixels, when I go to a
terminal, and go back to x, the display is ok, but still crashing after opening
any window...


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
