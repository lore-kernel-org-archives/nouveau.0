From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 20341] [NV31] lockup when using AGP. agpmode=0 fixes
	it.
Date: Sat, 19 Oct 2013 15:56:16 +0000
Message-ID: <bug-20341-8800-wYh4QlNhZS@http.bugs.freedesktop.org/>
References: <bug-20341-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1081666058=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-20341-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1081666058==
Content-Type: multipart/alternative; boundary="1382198176.aB0811.8458"; charset="us-ascii"


--1382198176.aB0811.8458
Date: Sat, 19 Oct 2013 15:56:16 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=20341

--- Comment #25 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Created attachment 87854
  --> https://bugs.freedesktop.org/attachment.cgi?id=87854&action=edit
quirk patch

Could you try this patch -- it adds a quirk to limit the mode to 2 for your
particular configuration. This is similar to the quirks that the radeon driver
uses, and was recommended to me as the proper way forward. (Unfortunately, it
seems like *combinations* of chipset/card are the issue, not just the chipset
on its own.)

I guessed about your chipset id, if it doesn't trigger, please attach the
output of lspci -vnn (I'd like to see it for both the chipset and your card).

You should see a print like

Setting agp speed to 2X. Use agpmode to override.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1382198176.aB0811.8458
Date: Sat, 19 Oct 2013 15:56:16 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - [NV31] lockup when using AGP. agpmode=0 fixes it."
   href="https://bugs.freedesktop.org/show_bug.cgi?id=20341#c25">Comment # 25</a>
              on <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - [NV31] lockup when using AGP. agpmode=0 fixes it."
   href="https://bugs.freedesktop.org/show_bug.cgi?id=20341">bug 20341</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=87854" name="attach_87854" title="quirk patch">attachment 87854</a> <a href="attachment.cgi?id=87854&amp;action=edit" title="quirk patch">[details]</a></span> <a href='page.cgi?id=splinter.html&amp;bug=20341&amp;attachment=87854'>[review]</a>
quirk patch

Could you try this patch -- it adds a quirk to limit the mode to 2 for your
particular configuration. This is similar to the quirks that the radeon driver
uses, and was recommended to me as the proper way forward. (Unfortunately, it
seems like *combinations* of chipset/card are the issue, not just the chipset
on its own.)

I guessed about your chipset id, if it doesn't trigger, please attach the
output of lspci -vnn (I'd like to see it for both the chipset and your card).

You should see a print like

Setting agp speed to 2X. Use agpmode to override.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1382198176.aB0811.8458--

--===============1081666058==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1081666058==--
