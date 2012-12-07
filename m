From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 57988] [regression][bisected][NV4E] LVDS output has
 offset to the right, part falling of is incorrectly painted on the left
Date: Fri, 07 Dec 2012 16:51:08 +0000
Message-ID: <bug-57988-8800-WSLYnrxq45@http.bugs.freedesktop.org/>
References: <bug-57988-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0422937309=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-57988-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0422937309==
Content-Type: multipart/alternative; boundary="1354899068.F34F5561.20907"; charset="us-ascii"


--1354899068.F34F5561.20907
Date: Fri, 7 Dec 2012 16:51:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=57988

--- Comment #7 from Ronald <ronald645-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Created attachment 71146
  --> https://bugs.freedesktop.org/attachment.cgi?id=71146&action=edit
Diff of regressed and non-regressed (with revert) dmesg

Maybe it helps..

P.S. I was not able to increase the debug level by passing nouveau.debug=5 tot
the kernel command line.

Any pointers on that one??

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1354899068.F34F5561.20907
Date: Fri, 7 Dec 2012 16:51:08 +0000
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
   title="NEW --- - [regression][bisected][NV4E] LVDS output has offset to the right, part falling of is incorrectly painted on the left"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=57988#c7">Comment # 7</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [regression][bisected][NV4E] LVDS output has offset to the right, part falling of is incorrectly painted on the left"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=57988">bug 57988</a>
              from <span class="vcard"><a class="email" href="mailto:ronald645&#64;gmail.com" title="Ronald &lt;ronald645&#64;gmail.com&gt;"> <span class="fn">Ronald</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=71146" name="attach_71146" title="Diff of regressed and non-regressed (with revert) dmesg">attachment 71146</a> <a href="attachment.cgi?id=71146&amp;action=edit" title="Diff of regressed and non-regressed (with revert) dmesg">[details]</a></span>
Diff of regressed and non-regressed (with revert) dmesg

Maybe it helps..

P.S. I was not able to increase the debug level by passing nouveau.debug=5 tot
the kernel command line.

Any pointers on that one??</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1354899068.F34F5561.20907--

--===============0422937309==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0422937309==--
