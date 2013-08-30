From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 51798] Cannot enable second video card on nvidia
	quadro NVS420
Date: Fri, 30 Aug 2013 18:51:29 +0000
Message-ID: <bug-51798-8800-mzX8b5X6YB@http.bugs.freedesktop.org/>
References: <bug-51798-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0204006216=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-51798-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0204006216==
Content-Type: multipart/alternative; boundary="1377888689.cDABBd3c1.22702"; charset="us-ascii"


--1377888689.cDABBd3c1.22702
Date: Fri, 30 Aug 2013 18:51:29 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=51798

--- Comment #6 from Ilya Ilyin <ilyin-qar0IOKqGHQ@public.gmane.org> ---
Thanks for your comments: I was certainly playing with xorg.conf with the
explicit specification of the BusID for each Device, but with no avail.

But the good or bad news is that our NVS420 device is ceased to exist any
longer: its cooling fun jammed, and it was burned up to 98C, then failed to
function properly even with two screens. We have replaced it with another dual
video port card, so that this case is closed for me so far, but your comments
would be useful for other people having a similar problem.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1377888689.cDABBd3c1.22702
Date: Fri, 30 Aug 2013 18:51:29 +0000
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
   title="NEW --- - Cannot enable second video card on nvidia quadro NVS420"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=51798#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Cannot enable second video card on nvidia quadro NVS420"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=51798">bug 51798</a>
              from <span class="vcard"><a class="email" href="mailto:ilyin&#64;aip.de" title="Ilya Ilyin &lt;ilyin&#64;aip.de&gt;"> <span class="fn">Ilya Ilyin</span></a>
</span></b>
        <pre>Thanks for your comments: I was certainly playing with xorg.conf with the
explicit specification of the BusID for each Device, but with no avail.

But the good or bad news is that our NVS420 device is ceased to exist any
longer: its cooling fun jammed, and it was burned up to 98C, then failed to
function properly even with two screens. We have replaced it with another dual
video port card, so that this case is closed for me so far, but your comments
would be useful for other people having a similar problem.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1377888689.cDABBd3c1.22702--

--===============0204006216==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0204006216==--
