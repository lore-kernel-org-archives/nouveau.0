From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 54437] linux-nouveau2.6 (3.6.0-rc4) : GTX580 : Xorg
 freezes when using accel
Date: Mon, 19 Aug 2013 18:22:08 +0000
Message-ID: <bug-54437-8800-UgjhGR2TYg@http.bugs.freedesktop.org/>
References: <bug-54437-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0388246755=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-54437-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0388246755==
Content-Type: multipart/alternative; boundary="1376936528.6bBF72.22858"; charset="us-ascii"


--1376936528.6bBF72.22858
Date: Mon, 19 Aug 2013 18:22:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=54437

--- Comment #5 from Kelly Doran <kel.p.doran-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Created attachment 84280
  --> https://bugs.freedesktop.org/attachment.cgi?id=84280&action=edit
kernel log of card freeze

Another dmesg log of the freeze.  Note that the read fault is not always at the
same address.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1376936528.6bBF72.22858
Date: Mon, 19 Aug 2013 18:22:08 +0000
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
   title="NEW --- - linux-nouveau2.6 (3.6.0-rc4) : GTX580 : Xorg freezes when using accel"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=54437#c5">Comment # 5</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - linux-nouveau2.6 (3.6.0-rc4) : GTX580 : Xorg freezes when using accel"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=54437">bug 54437</a>
              from <span class="vcard"><a class="email" href="mailto:kel.p.doran&#64;gmail.com" title="Kelly Doran &lt;kel.p.doran&#64;gmail.com&gt;"> <span class="fn">Kelly Doran</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=84280" name="attach_84280" title="kernel log of card freeze">attachment 84280</a> <a href="attachment.cgi?id=84280&amp;action=edit" title="kernel log of card freeze">[details]</a></span>
kernel log of card freeze

Another dmesg log of the freeze.  Note that the read fault is not always at the
same address.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1376936528.6bBF72.22858--

--===============0388246755==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0388246755==--
