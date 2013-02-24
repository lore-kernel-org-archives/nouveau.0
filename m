From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 59057] Black screen after resume from s2ram
Date: Sun, 24 Feb 2013 19:31:04 +0000
Message-ID: <bug-59057-8800-EE7NRUDBMX@http.bugs.freedesktop.org/>
References: <bug-59057-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0545871040=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-59057-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0545871040==
Content-Type: multipart/alternative; boundary="1361734265.4F64304.17327"; charset="us-ascii"


--1361734265.4F64304.17327
Date: Sun, 24 Feb 2013 19:31:05 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=59057

--- Comment #29 from J Binder <wheel-pGoT+mvyLdp4LYgiJMQgWbNAH6kLmebB@public.gmane.org> ---
Created attachment 75454
  --> https://bugs.freedesktop.org/attachment.cgi?id=75454&action=edit
Trace dmesg for successful suspend/resume with 3.8.0+ built on 21.2.2013

Latest commit for this build is 2fee6f58d23e7bc2b8d9c599ae1353684043942a.

As in comment #27, suspen/resume works fine.
KDE login ist problematic as it freezes the graphics driver sone of the time.

Suspend/resume and logging in after that worked fine, though, which is what the
attached dmesg shows.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1361734265.4F64304.17327
Date: Sun, 24 Feb 2013 19:31:05 +0000
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
   title="NEW --- - Black screen after resume from s2ram"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=59057#c29">Comment # 29</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Black screen after resume from s2ram"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=59057">bug 59057</a>
              from <span class="vcard"><a class="email" href="mailto:wheel&#64;herr-der-mails.de" title="J Binder &lt;wheel&#64;herr-der-mails.de&gt;"> <span class="fn">J Binder</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=75454" name="attach_75454" title="Trace dmesg for successful suspend/resume with 3.8.0+ built on 21.2.2013">attachment 75454</a> <a href="attachment.cgi?id=75454&amp;action=edit" title="Trace dmesg for successful suspend/resume with 3.8.0+ built on 21.2.2013">[details]</a></span>
Trace dmesg for successful suspend/resume with 3.8.0+ built on 21.2.2013

Latest commit for this build is 2fee6f58d23e7bc2b8d9c599ae1353684043942a.

As in <a href="show_bug.cgi?id=59057#c27">comment #27</a>, suspen/resume works fine.
KDE login ist problematic as it freezes the graphics driver sone of the time.

Suspend/resume and logging in after that worked fine, though, which is what the
attached dmesg shows.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1361734265.4F64304.17327--

--===============0545871040==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0545871040==--
