From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 39530] Also after installing Obermayrs drm-nouveau
 driver booting succeeds only with nomodeset
Date: Tue, 26 Jul 2011 13:30:29 -0700 (PDT)
Message-ID: <20110726203029.3DC36130169@annarchy.freedesktop.org>
References: <bug-39530-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-39530-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

https://bugs.freedesktop.org/show_bug.cgi?id=39530

--- Comment #5 from Lee Matheson <lee_matheson-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org> 2011-07-26 13:30:29 PDT ---
@ Guido - I've seen http://nouveau.freedesktop.org/wiki/KernelModeSetting but
there is nothing in there needed for me. Johannes Obermayr's fix worked for me.
I have the nouveau driver working.

This bug report was raised to address an issue observed by j.reitsma and it may
not be the same as yours. I agreed to test Johannes Obermayr's build. I tested
it. It worked. 

I also don't think we should needlessly obscure this bug report if what you
encountered is different.

You mentioned me having a nomodest issue. I don't have a nomodeset issue. I am
now using the nouveau driver.  

In my above post I attached what I hope are helpful log files.

I'm really keen to change my successful GNU/Linux install configuration with
the nouveau driver and the 3.0 RC7 kernel (with openSUSE-12.1 milestone3) as I
have been asked to do OTHER LXDE desktop testing (with GTK3) that may obscure
the success of this configuration, and I would like to stop my support here for
this bug.  I don't have the technical knowledge here to offer much. I was asked
test a specific package. I did. It worked.

So I am hoping there are no requests for further information on this successful
nouveau install from me, using nVidia FX5200 hardware on a 32-bit 3.0 RC7
kernel (openSUSE-12.1 Milestone3).

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
