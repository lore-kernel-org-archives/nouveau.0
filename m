From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70208] Nouveau driver doesn't find vbios for Geforce
 GT 750M on Asus N750JV laptop
Date: Sun, 06 Oct 2013 20:45:20 +0000
Message-ID: <bug-70208-8800-w6JIOrnEek@http.bugs.freedesktop.org/>
References: <bug-70208-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1844729394=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-70208-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1844729394==
Content-Type: multipart/alternative; boundary="1381092320.Dd4BB4BF1.20999"; charset="us-ascii"


--1381092320.Dd4BB4BF1.20999
Date: Sun, 6 Oct 2013 20:45:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=70208

--- Comment #5 from 4712.joey-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org ---
Created attachment 87210
  --> https://bugs.freedesktop.org/attachment.cgi?id=87210&action=edit
Full dmesg with patch from attachment 87207 applied

In addition to the patch an additional line of debug output was added which
shows the "JOEY: Yes this is the patched module"... Please just ignore this
line of debug output in the dmesg :-)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1381092320.Dd4BB4BF1.20999
Date: Sun, 6 Oct 2013 20:45:20 +0000
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
   title="NEW --- - Nouveau driver doesn't find vbios for Geforce GT 750M on Asus N750JV laptop"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70208#c5">Comment # 5</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Nouveau driver doesn't find vbios for Geforce GT 750M on Asus N750JV laptop"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70208">bug 70208</a>
              from <span class="vcard"><a class="email" href="mailto:4712.joey&#64;gmail.com" title="4712.joey&#64;gmail.com">4712.joey&#64;gmail.com</a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=87210" name="attach_87210" title="Full dmesg with patch from attachment 87207 applied">attachment 87210</a> <a href="attachment.cgi?id=87210&amp;action=edit" title="Full dmesg with patch from attachment 87207 applied">[details]</a></span>
Full dmesg with patch from <span class=""><a href="attachment.cgi?id=87207" name="attach_87207" title="retry 16 times to retrieve the vbios from ACPI">attachment 87207</a> <a href="attachment.cgi?id=87207&amp;action=edit" title="retry 16 times to retrieve the vbios from ACPI">[details]</a></span> <a href='page.cgi?id=splinter.html&amp;bug=70208&amp;attachment=87207'>[review]</a> applied

In addition to the patch an additional line of debug output was added which
shows the &quot;JOEY: Yes this is the patched module&quot;... Please just ignore this
line of debug output in the dmesg :-)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1381092320.Dd4BB4BF1.20999--

--===============1844729394==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1844729394==--
