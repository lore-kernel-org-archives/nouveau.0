From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 79518] nouveau causes lockup and reboot on GT215
Date: Mon, 02 Jun 2014 01:36:50 +0000
Message-ID: <bug-79518-8800-7RvskAL9aG@http.bugs.freedesktop.org/>
References: <bug-79518-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2038402826=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-79518-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============2038402826==
Content-Type: multipart/alternative; boundary="1401673010.e68E1.9465"; charset="us-ascii"


--1401673010.e68E1.9465
Date: Mon, 2 Jun 2014 01:36:50 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=79518

--- Comment #1 from Adam Borowski <kilobyte-b9QjgO8OEXPVItvQsEIGlw@public.gmane.org> ---
Created attachment 100259
  --> https://bugs.freedesktop.org/attachment.cgi?id=100259&action=edit
another log, with DRM=debug

TJK on IRC suggested to boot with: nouveau.debug=DRM=debug drm.debug=0xe
Here's a log with these settings.  This time, there was no delay between the
lockup and reboot.  The log contains some stack traces, but they apparently
come from the serial console being unable to cope with big bursts of debug
info, and thus are unrelated to the problem at hand.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1401673010.e68E1.9465
Date: Mon, 2 Jun 2014 01:36:50 +0000
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
          bz_status_NEW "
   title="NEW --- - nouveau causes lockup and reboot on GT215"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=79518#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - nouveau causes lockup and reboot on GT215"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=79518">bug 79518</a>
              from <span class="vcard"><a class="email" href="mailto:kilobyte&#64;angband.pl" title="Adam Borowski &lt;kilobyte&#64;angband.pl&gt;"> <span class="fn">Adam Borowski</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=100259" name="attach_100259" title="another log, with DRM=debug">attachment 100259</a> <a href="attachment.cgi?id=100259&amp;action=edit" title="another log, with DRM=debug">[details]</a></span>
another log, with DRM=debug

TJK on IRC suggested to boot with: nouveau.debug=DRM=debug drm.debug=0xe
Here's a log with these settings.  This time, there was no delay between the
lockup and reboot.  The log contains some stack traces, but they apparently
come from the serial console being unable to cope with big bursts of debug
info, and thus are unrelated to the problem at hand.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1401673010.e68E1.9465--

--===============2038402826==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2038402826==--
