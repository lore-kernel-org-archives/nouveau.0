From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 39099] two graphic cards and four monitors with
	Nouveau
Date: Mon, 18 Jul 2011 12:46:33 -0700 (PDT)
Message-ID: <20110718194633.D257413010B@annarchy.freedesktop.org>
References: <bug-39099-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-39099-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=39099

--- Comment #5 from Damian Nowak <nowaker-qMBiBlq7xnnVItvQsEIGlw@public.gmane.org> 2011-07-18 12:46:33 PDT ---
I git pulled the drivers and applied your patch. Apparently it works - although
your patch prints debug info only, you say.

21:03 < Nowaker> xexaxo: your patch made those four monitors working :)
21:04 < Nowaker> xexaxo: sorry for testing it out so late but I played OpenTTD
with my friends for three days in a row, and then got some work to do
21:10 < xexaxo> Nowaker: the patch or the configuration ?
21:10 < xexaxo> the patch only added some debug output
21:11 < Nowaker> xexaxo: the patch
21:11 < Nowaker> xexaxo: so someone fixed the issue in meantime on git
21:12 < Nowaker> I'm just uploading the logs
21:12 < xexaxo> Nowaker: can  you make sure that it's the patch, and try
attaching the Xorg.log with/wo the patch (3 and 4 monitors please)

http://wklej.org/id/563568/txt/ - git+patch - 3-setup (working)
http://wklej.org/id/563558/txt/ - git+patch - 4-setup (working)

After `git reset --hard`

http://wklej.org/id/563575/txt/ - git - 3-setup (working)
http://wklej.org/id/563572/txt/ - git - 4-setup (failing the same way)

Looks like you really fixed it:

+        if (!IsShared || ScreenEq ) // <- this!
             drmmode_crtc_init(pScrn, drmmode, i);

I made sure it's you who fixed the problem - twice. ;)

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
