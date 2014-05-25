From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 79204] [NV50] No reported temperature/fan speed on
	GTX260
Date: Sun, 25 May 2014 13:31:17 +0000
Message-ID: <bug-79204-8800-0Wtx91Vny2@http.bugs.freedesktop.org/>
References: <bug-79204-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0312916719=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-79204-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0312916719==
Content-Type: multipart/alternative; boundary="1401024677.bd24ca72.6652"; charset="us-ascii"


--1401024677.bd24ca72.6652
Date: Sun, 25 May 2014 13:31:17 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=79204

--- Comment #3 from Martin Peres <martin.peres-Iz16wY1oaNPLSKGbIzaifA@public.gmane.org> ---
Created attachment 99767
  --> https://bugs.freedesktop.org/attachment.cgi?id=99767&action=edit
drm/nouveau/i2c: bump the i2c delay for the adt7473

Your card has an external sensor, but it doesn't answer to requests. This may
be due to us driving the communication too fast. Please try this patch that
halves the communication baudrate with your adt7473.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1401024677.bd24ca72.6652
Date: Sun, 25 May 2014 13:31:17 +0000
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
   title="NEW --- - [NV50] No reported temperature/fan speed on GTX260"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=79204#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV50] No reported temperature/fan speed on GTX260"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=79204">bug 79204</a>
              from <span class="vcard"><a class="email" href="mailto:martin.peres&#64;ensi-bourges.fr" title="Martin Peres &lt;martin.peres&#64;ensi-bourges.fr&gt;"> <span class="fn">Martin Peres</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=99767" name="attach_99767" title="drm/nouveau/i2c: bump the i2c delay for the adt7473">attachment 99767</a> <a href="attachment.cgi?id=99767&amp;action=edit" title="drm/nouveau/i2c: bump the i2c delay for the adt7473">[details]</a></span> <a href='page.cgi?id=splinter.html&amp;bug=79204&amp;attachment=99767'>[review]</a>
drm/nouveau/i2c: bump the i2c delay for the adt7473

Your card has an external sensor, but it doesn't answer to requests. This may
be due to us driving the communication too fast. Please try this patch that
halves the communication baudrate with your adt7473.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1401024677.bd24ca72.6652--

--===============0312916719==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0312916719==--
