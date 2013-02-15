From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 57350] [nouveau,
 linux-3.7-rc] Broken cursor and kernel log swamped with trapped
 reads/writes from BAR/PFIFO_READ/FB
Date: Fri, 15 Feb 2013 09:54:04 +0000
Message-ID: <bug-57350-8800-RXond06WDy@http.bugs.freedesktop.org/>
References: <bug-57350-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1989063215=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-57350-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1989063215==
Content-Type: multipart/alternative; boundary="1360922044.04334.28297"; charset="us-ascii"


--1360922044.04334.28297
Date: Fri, 15 Feb 2013 09:54:04 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=57350

--- Comment #20 from Bruno <bonbons67-H4aWS73dXupiYsDpGMXq6A@public.gmane.org> ---
Created attachment 74862
  --> https://bugs.freedesktop.org/attachment.cgi?id=74862&action=edit
Kernel config + compile log for 3863c9bc887e9638a9d905d55f6038641ece78d6

This includes the build log for rebuilding (trying to) kernel after touching
all files under drivers/gpu/drm/nouveau.

The kernel config preceeds the build log in the same file.

For the whole range of commits where compilation fails the errors are the same
though I did not take extra care to check if it was always failing for the same
source files.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1360922044.04334.28297
Date: Fri, 15 Feb 2013 09:54:04 +0000
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
   title="NEW --- - [nouveau, linux-3.7-rc] Broken cursor and kernel log swamped with trapped reads/writes from BAR/PFIFO_READ/FB"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=57350#c20">Comment # 20</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [nouveau, linux-3.7-rc] Broken cursor and kernel log swamped with trapped reads/writes from BAR/PFIFO_READ/FB"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=57350">bug 57350</a>
              from <span class="vcard"><a class="email" href="mailto:bonbons67&#64;internet.lu" title="Bruno &lt;bonbons67&#64;internet.lu&gt;"> <span class="fn">Bruno</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=74862" name="attach_74862" title="Kernel config + compile log for 3863c9bc887e9638a9d905d55f6038641ece78d6">attachment 74862</a> <a href="attachment.cgi?id=74862&amp;action=edit" title="Kernel config + compile log for 3863c9bc887e9638a9d905d55f6038641ece78d6">[details]</a></span>
Kernel config + compile log for 3863c9bc887e9638a9d905d55f6038641ece78d6

This includes the build log for rebuilding (trying to) kernel after touching
all files under drivers/gpu/drm/nouveau.

The kernel config preceeds the build log in the same file.

For the whole range of commits where compilation fails the errors are the same
though I did not take extra care to check if it was always failing for the same
source files.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1360922044.04334.28297--

--===============1989063215==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1989063215==--
