From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 82247] New: [NVA8] The DisplayPort screen does not
 light up at first try on Linux 3.16
Date: Wed, 06 Aug 2014 12:10:56 +0000
Message-ID: <bug-82247-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2079438727=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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


--===============2079438727==
Content-Type: multipart/alternative; boundary="1407327056.Bb361.10482"; charset="us-ascii"


--1407327056.Bb361.10482
Date: Wed, 6 Aug 2014 12:10:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=82247

          Priority: medium
            Bug ID: 82247
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: [NVA8] The DisplayPort screen does not light up at
                    first try on Linux 3.16
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: martin.peres-Iz16wY1oaNPLSKGbIzaifA@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

Created attachment 104148
  --> https://bugs.freedesktop.org/attachment.cgi?id=104148&action=edit
When the DP screen doesn't light up

Hey Ben,

Oddly-enough, my DP screen at work does not want to light up after a cold boot
but works if I reboot right away.

As I told you before, this screen is weird when it comes to coming back from
sleep mode.

The DVI screen lights up correctly but I doubt this issue is related to dual
screen because I tried unplugging the DVI screen a while ago to investigate the
resume issue and it didn't help.

I attached to the bug the kernel logs with 
nouveau.debug="PDISP=trace,I2C=trace,VBIOS=trace" for both the case when the
screen doesn't light up and when it does.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1407327056.Bb361.10482
Date: Wed, 6 Aug 2014 12:10:56 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><table border="1" cellspacing="0" cellpadding="8">
        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Bug ID</th>
          <td><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVA8] The DisplayPort screen does not light up at first try on Linux 3.16"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=82247">82247</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[NVA8] The DisplayPort screen does not light up at first try on Linux 3.16
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>normal
          </td>
        </tr>

        <tr>
          <th>Classification</th>
          <td>Unclassified
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>Linux (All)
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>martin.peres&#64;ensi-bourges.fr
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86-64 (AMD64)
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>unspecified
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Driver/nouveau
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=104148" name="attach_104148" title="When the DP screen doesn't light up">attachment 104148</a> <a href="attachment.cgi?id=104148&amp;action=edit" title="When the DP screen doesn't light up">[details]</a></span>
When the DP screen doesn't light up

Hey Ben,

Oddly-enough, my DP screen at work does not want to light up after a cold boot
but works if I reboot right away.

As I told you before, this screen is weird when it comes to coming back from
sleep mode.

The DVI screen lights up correctly but I doubt this issue is related to dual
screen because I tried unplugging the DVI screen a while ago to investigate the
resume issue and it didn't help.

I attached to the bug the kernel logs with 
nouveau.debug=&quot;PDISP=trace,I2C=trace,VBIOS=trace&quot; for both the case when the
screen doesn't light up and when it does.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1407327056.Bb361.10482--

--===============2079438727==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2079438727==--
