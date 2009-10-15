From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 18638] nouveau fails on GeForce 9400M
Date: Thu, 15 Oct 2009 12:24:42 -0700 (PDT)
Message-ID: <20091015192442.C3351130061@annarchy.freedesktop.org>
References: <bug-18638-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-18638-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=18638


Johannes Obermayr <johannesobermayr-Mmb7MZpHnFY@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
           Priority|medium                      |high
            Summary|nouveau fails on GeForce    |nouveau fails on GeForce
                   |9400M (Apple Macbook 5.1)   |9400M




--- Comment #9 from Johannes Obermayr <johannesobermayr-Mmb7MZpHnFY@public.gmane.org>  2009-10-15 12:24:41 PST ---
I provide a mmiotrace for 9400M and via HDMI->HDMI connected LCD:

http://www.file-upload.net/download-1947951/9400M-HDMI-mmiotrace.tar.gz.html (~
12 MiB)

I know it is not for a Macbook but it should also help; it could also be
helpful for bug #23373...

Because it seems that there are currently problems with this chipset on all
systems I am truncating the bug to "nouveau fails on GeForce 9400M" and
changing priority to "high"...

If you need more mmiotraces I can provide them also for DVI->HDMI, DVI->VGA and
VGA->VGA (via specific cables...).


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
