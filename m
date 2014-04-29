From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 78092] GK208M [GeForce GT 730M] (rev ff) (prog-if
 ff) nouveau module load fail
Date: Tue, 29 Apr 2014 20:10:19 +0000
Message-ID: <bug-78092-8800-jacfrC06SB@http.bugs.freedesktop.org/>
References: <bug-78092-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0890404801=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-78092-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0890404801==
Content-Type: multipart/alternative; boundary="1398802218.b48Fb73F0.12570"; charset="us-ascii"


--1398802218.b48Fb73F0.12570
Date: Tue, 29 Apr 2014 20:10:18 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=78092

--- Comment #4 from Anton Gubarkov <anton.gubarkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Created attachment 98193
  --> https://bugs.freedesktop.org/attachment.cgi?id=98193&action=edit
dmesg after 1st patch

I need to wait until my distro (gentoo) makes 3.15 available. 
meanwhile I applied the 1st patch to my current 3.14 kernel.

It did find some BIOS, but some errors appeared. The bumblebee still fails to
run glxinfo.

dmesg is attached if you are interested.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1398802218.b48Fb73F0.12570
Date: Tue, 29 Apr 2014 20:10:18 +0000
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
   title="NEW --- - GK208M [GeForce GT 730M] (rev ff) (prog-if ff) nouveau module load fail"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=78092#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - GK208M [GeForce GT 730M] (rev ff) (prog-if ff) nouveau module load fail"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=78092">bug 78092</a>
              from <span class="vcard"><a class="email" href="mailto:anton.gubarkov&#64;gmail.com" title="Anton Gubarkov &lt;anton.gubarkov&#64;gmail.com&gt;"> <span class="fn">Anton Gubarkov</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=98193" name="attach_98193" title="dmesg after 1st patch">attachment 98193</a> <a href="attachment.cgi?id=98193&amp;action=edit" title="dmesg after 1st patch">[details]</a></span>
dmesg after 1st patch

I need to wait until my distro (gentoo) makes 3.15 available. 
meanwhile I applied the 1st patch to my current 3.14 kernel.

It did find some BIOS, but some errors appeared. The bumblebee still fails to
run glxinfo.

dmesg is attached if you are interested.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1398802218.b48Fb73F0.12570--

--===============0890404801==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0890404801==--
