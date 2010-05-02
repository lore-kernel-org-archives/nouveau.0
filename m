From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 27574] BUG: unable to handle kernel NULL pointer
 dereference at 0000000000000028
Date: Sun,  2 May 2010 14:50:55 -0700 (PDT)
Message-ID: <20100502215055.10DAF13004F@annarchy.freedesktop.org>
References: <bug-27574-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-27574-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=27574

--- Comment #9 from Alexander <alex.vizor-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> 2010-05-02 14:50:54 PDT ---
I still can't reproduce exactly this bug with proposed debugging but I have
following error or something like this after which system or just X completely
freeze and doesn't respond


May  3 00:37:40 loki kernel: [47292.941614] video LNXVIDEO:01: Restoring
backlight state
May  3 00:37:40 loki kernel: [47293.171676] [TTM] mem->mem_type 2
May  3 00:37:40 loki kernel: [47293.185220] [drm] nouveau 0000:01:00.0:
PFIFO_DMA_PUSHER - Ch 2
May  3 00:37:40 loki kernel: [47293.186640] [drm] nouveau 0000:01:00.0:
PFIFO_CACHE_ERROR - Ch 2/0 Mthd 0x0000 Data 0x0f000000
May  3 00:37:40 loki kernel: [47293.186651] [drm] nouveau 0000:01:00.0:
PFIFO_DMA_PUSHER - Ch 2

it happens on resume from ram also

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
