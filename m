From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 79823] [NV30/gallium] Mozilla apps freeze on startup
 with nouveau-dri-10.2.1 libs on dual-screen
Date: Thu, 19 Jun 2014 09:38:01 +0000
Message-ID: <bug-79823-8800-BiZ0J1BoNR@http.bugs.freedesktop.org/>
References: <bug-79823-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1934215683=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-79823-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1934215683==
Content-Type: multipart/alternative; boundary="1403170681.CD0eD3a0.27149"; charset="us-ascii"


--1403170681.CD0eD3a0.27149
Date: Thu, 19 Jun 2014 09:38:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=79823

--- Comment #31 from Natrio <natrio-cmBhpYW9OiY@public.gmane.org> ---
Created attachment 101350
  --> https://bugs.freedesktop.org/attachment.cgi?id=101350&action=edit
GDB log with "dup fd..." patch

It works!

 Before first close:
$ ls -l /proc/29981/fd/
total 0
lrwx------ 1 user users 64 Jun 19 13:20 0 -> /dev/pts/0
lrwx------ 1 user users 64 Jun 19 13:20 1 -> /dev/pts/0
lrwx------ 1 user users 64 Jun 19 13:20 2 -> /dev/pts/0
lrwx------ 1 user users 64 Jun 19 13:20 3 -> socket:[1333878]
lrwx------ 1 user users 64 Jun 19 13:20 4 -> /dev/dri/card0
lrwx------ 1 user users 64 Jun 19 13:20 5 -> /dev/dri/card0
lrwx------ 1 user users 64 Jun 19 13:20 6 -> /dev/dri/card0

 After first close:
$ ls -l /proc/29981/fd/
total 0
lrwx------ 1 user users 64 Jun 19 13:20 0 -> /dev/pts/0
lrwx------ 1 user users 64 Jun 19 13:20 1 -> /dev/pts/0
lrwx------ 1 user users 64 Jun 19 13:20 2 -> /dev/pts/0
lrwx------ 1 user users 64 Jun 19 13:20 3 -> socket:[1333878]
lrwx------ 1 user users 64 Jun 19 13:20 5 -> /dev/dri/card0
lrwx------ 1 user users 64 Jun 19 13:20 6 -> /dev/dri/card0

 After second close:
$ ls -l /proc/29981/fd/
total 0
lrwx------ 1 user users 64 Jun 19 13:20 0 -> /dev/pts/0
lrwx------ 1 user users 64 Jun 19 13:20 1 -> /dev/pts/0
lrwx------ 1 user users 64 Jun 19 13:20 2 -> /dev/pts/0
lrwx------ 1 user users 64 Jun 19 13:20 3 -> socket:[1333878]
lrwx------ 1 user users 64 Jun 19 13:20 6 -> /dev/dri/card0

 After third close:
$ ls -l /proc/29981/fd/
total 0
lrwx------ 1 user users 64 Jun 19 13:20 0 -> /dev/pts/0
lrwx------ 1 user users 64 Jun 19 13:20 1 -> /dev/pts/0
lrwx------ 1 user users 64 Jun 19 13:20 2 -> /dev/pts/0
lrwx------ 1 user users 64 Jun 19 13:20 3 -> socket:[1333878]

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1403170681.CD0eD3a0.27149
Date: Thu, 19 Jun 2014 09:38:01 +0000
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
   title="NEW --- - [NV30/gallium] Mozilla apps freeze on startup with nouveau-dri-10.2.1 libs on dual-screen"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=79823#c31">Comment # 31</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV30/gallium] Mozilla apps freeze on startup with nouveau-dri-10.2.1 libs on dual-screen"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=79823">bug 79823</a>
              from <span class="vcard"><a class="email" href="mailto:natrio&#64;list.ru" title="Natrio &lt;natrio&#64;list.ru&gt;"> <span class="fn">Natrio</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=101350" name="attach_101350" title="GDB log with &quot;dup fd...&quot; patch">attachment 101350</a> <a href="attachment.cgi?id=101350&amp;action=edit" title="GDB log with &quot;dup fd...&quot; patch">[details]</a></span>
GDB log with &quot;dup fd...&quot; patch

It works!

 Before first close:
$ ls -l /proc/29981/fd/
total 0
lrwx------ 1 user users 64 Jun 19 13:20 0 -&gt; /dev/pts/0
lrwx------ 1 user users 64 Jun 19 13:20 1 -&gt; /dev/pts/0
lrwx------ 1 user users 64 Jun 19 13:20 2 -&gt; /dev/pts/0
lrwx------ 1 user users 64 Jun 19 13:20 3 -&gt; socket:[1333878]
lrwx------ 1 user users 64 Jun 19 13:20 4 -&gt; /dev/dri/card0
lrwx------ 1 user users 64 Jun 19 13:20 5 -&gt; /dev/dri/card0
lrwx------ 1 user users 64 Jun 19 13:20 6 -&gt; /dev/dri/card0

 After first close:
$ ls -l /proc/29981/fd/
total 0
lrwx------ 1 user users 64 Jun 19 13:20 0 -&gt; /dev/pts/0
lrwx------ 1 user users 64 Jun 19 13:20 1 -&gt; /dev/pts/0
lrwx------ 1 user users 64 Jun 19 13:20 2 -&gt; /dev/pts/0
lrwx------ 1 user users 64 Jun 19 13:20 3 -&gt; socket:[1333878]
lrwx------ 1 user users 64 Jun 19 13:20 5 -&gt; /dev/dri/card0
lrwx------ 1 user users 64 Jun 19 13:20 6 -&gt; /dev/dri/card0

 After second close:
$ ls -l /proc/29981/fd/
total 0
lrwx------ 1 user users 64 Jun 19 13:20 0 -&gt; /dev/pts/0
lrwx------ 1 user users 64 Jun 19 13:20 1 -&gt; /dev/pts/0
lrwx------ 1 user users 64 Jun 19 13:20 2 -&gt; /dev/pts/0
lrwx------ 1 user users 64 Jun 19 13:20 3 -&gt; socket:[1333878]
lrwx------ 1 user users 64 Jun 19 13:20 6 -&gt; /dev/dri/card0

 After third close:
$ ls -l /proc/29981/fd/
total 0
lrwx------ 1 user users 64 Jun 19 13:20 0 -&gt; /dev/pts/0
lrwx------ 1 user users 64 Jun 19 13:20 1 -&gt; /dev/pts/0
lrwx------ 1 user users 64 Jun 19 13:20 2 -&gt; /dev/pts/0
lrwx------ 1 user users 64 Jun 19 13:20 3 -&gt; socket:[1333878]</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1403170681.CD0eD3a0.27149--

--===============1934215683==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1934215683==--
