From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 27501] nVidia 9600M GT (Macbook Pro current model)
 is unable to boot
Date: Sat, 10 Apr 2010 02:10:47 -0700 (PDT)
Message-ID: <20100410091047.BF84C130060@annarchy.freedesktop.org>
References: <bug-27501-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-27501-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
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

https://bugs.freedesktop.org/show_bug.cgi?id=27501

--- Comment #3 from Ricardo Salveti de Araujo <rsalveti-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> 2010-04-10 02:10:47 PDT ---
Created an attachment (id=34863)
 --> (https://bugs.freedesktop.org/attachment.cgi?id=34863)
PRAMIN flush timout stack

Just tested with latest GIT revision available at Linus' tree
(0eddb519b9127c73d53db4bf3ec1d45b13f844d1). That's after merging the latest
drm/nouveau code, and I'm still facing this issue.

Probably this bug is only happening with MacBook Pro version.

My system:
 * MacBook Pro 5,1
 * Booting with normal bios mode (grub)
 * 02:00.0 VGA compatible controller [0300]: nVidia Corporation G96 [GeForce
9600M GT] [10de:0647] (rev a1) (prog-if 00 [VGA controller])

Tested with nomodeset but I ended up in another bug (acpi related).

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
