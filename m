From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 67315] [NVAA] System lockup with X consuming all CPU
Date: Thu, 25 Sep 2014 12:01:06 +0000
Message-ID: <bug-67315-8800-VX6yoc6kvB@http.bugs.freedesktop.org/>
References: <bug-67315-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1536468677=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-67315-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1536468677==
Content-Type: multipart/alternative; boundary="1411646466.3b442.14366"; charset="us-ascii"


--1411646466.3b442.14366
Date: Thu, 25 Sep 2014 12:01:06 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=67315

--- Comment #23 from Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org> ---
Created attachment 106849
  --> https://bugs.freedesktop.org/attachment.cgi?id=106849&action=edit
Add some writes to 0x100c14

Does this patch help (applying it to a recent kernel code would be better)?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1411646466.3b442.14366
Date: Thu, 25 Sep 2014 12:01:06 +0000
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
   title="NEW --- - [NVAA] System lockup with X consuming all CPU"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67315#c23">Comment # 23</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVAA] System lockup with X consuming all CPU"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67315">bug 67315</a>
              from <span class="vcard"><a class="email" href="mailto:pierre.morrow&#64;free.fr" title="Pierre Moreau &lt;pierre.morrow&#64;free.fr&gt;"> <span class="fn">Pierre Moreau</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=106849" name="attach_106849" title="Add some writes to 0x100c14">attachment 106849</a> <a href="attachment.cgi?id=106849&amp;action=edit" title="Add some writes to 0x100c14">[details]</a></span> <a href='page.cgi?id=splinter.html&amp;bug=67315&amp;attachment=106849'>[review]</a>
Add some writes to 0x100c14

Does this patch help (applying it to a recent kernel code would be better)?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1411646466.3b442.14366--

--===============1536468677==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1536468677==--
