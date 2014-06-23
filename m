From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: [Mesa-dev] [PATCH v3 1/4] nvc0/ir: clear subop when
 folding constant expressions
Date: Mon, 23 Jun 2014 19:43:08 -0400
Message-ID: <CAKb7UvgB8tK9OannYow7MX-aAyU7qJgoXSDFcHAjVYfdCrHcQA@mail.gmail.com>
References: <1401834950-20257-1-git-send-email-tobias.johannes.klausmann@mni.thm.de>
 <1401834950-20257-2-git-send-email-tobias.johannes.klausmann@mni.thm.de>
 <87egyfi4xn.fsf@yoom.home.cworth.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary=001a11c20d02c9844104fc89678d
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <87egyfi4xn.fsf-dGZf2j/AgvDc+SJF09bjuWD2FQJk+8+b@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Carl Worth <cworth-4HiWtcSh4w0dnm+yROfE0A@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

--001a11c20d02c9844104fc89678d
Content-Type: text/plain; charset=UTF-8

On Mon, Jun 23, 2014 at 7:25 PM, Carl Worth <cworth-4HiWtcSh4w0dnm+yROfE0A@public.gmane.org> wrote:
> Tobias Klausmann <tobias.johannes.klausmann-AqjdNwhu20eELgA04lAiVw@public.gmane.org> writes:
>> Some operations (e.g. OP_MUL/OP_MAD/OP_EXTBF might have a subop set.
>> After folding, make sure that it is cleared
>>
>> Signed-off-by: Tobias Klausmann <tobias.johannes.klausmann-AqjdNwhu20eELgA04lAiVw@public.gmane.org>
>> Reviewed-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
> Cc: "10.1 10.2" <mesa-stable-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
>
> Hi Tobias and Ilia,
>
> This patch isn't picking cleanly over to the 10.1 branch.
>
> Can you give me some guidance here? Either of the following replies
> would be great:
>
>         Don't worry about this for 10.1 because...
>
>         Here's a backported patch for 10.1...

Here's a backported patch for 10.1...

  -ilia

--001a11c20d02c9844104fc89678d
Content-Type: text/x-patch; charset=US-ASCII;
	name="0001-nv50-ir-clear-subop-when-folding-constant-expression.patch"
Content-Disposition: attachment;
	filename="0001-nv50-ir-clear-subop-when-folding-constant-expression.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_hwsfixem1

RnJvbSBkYjMwYzAyMmZmOWU4M2U4YmY0MjE3NzY0MmFmODY2M2QyNmMwY2FjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBUb2JpYXMgS2xhdXNtYW5uIDx0b2JpYXMuam9oYW5uZXMua2xh
dXNtYW5uQG1uaS50aG0uZGU+CkRhdGU6IFdlZCwgNCBKdW4gMjAxNCAwMDozNTo0NyArMDIwMApT
dWJqZWN0OiBbUEFUQ0hdIG52NTAvaXI6IGNsZWFyIHN1Ym9wIHdoZW4gZm9sZGluZyBjb25zdGFu
dCBleHByZXNzaW9ucwoKU29tZSBvcGVyYXRpb25zIChlLmcuIE9QX01VTC9PUF9NQUQvT1BfRVhU
QkYpIG1pZ2h0IGhhdmUgYSBzdWJvcCBzZXQuCkFmdGVyIGZvbGRpbmcsIG1ha2Ugc3VyZSB0aGF0
IGl0IGlzIGNsZWFyZWQKClNpZ25lZC1vZmYtYnk6IFRvYmlhcyBLbGF1c21hbm4gPHRvYmlhcy5q
b2hhbm5lcy5rbGF1c21hbm5AbW5pLnRobS5kZT4KUmV2aWV3ZWQtYnk6IElsaWEgTWlya2luIDxp
bWlya2luQGFsdW0ubWl0LmVkdT4KQ2M6ICIxMC4xIDEwLjIiIDxtZXNhLXN0YWJsZUBsaXN0cy5m
cmVlZGVza3RvcC5vcmc+Ci0tLQogc3JjL2dhbGxpdW0vZHJpdmVycy9ub3V2ZWF1L2NvZGVnZW4v
bnY1MF9pcl9wZWVwaG9sZS5jcHAgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KQoKZGlmZiAtLWdpdCBhL3NyYy9nYWxsaXVtL2RyaXZlcnMvbm91dmVhdS9jb2RlZ2VuL252NTBf
aXJfcGVlcGhvbGUuY3BwIGIvc3JjL2dhbGxpdW0vZHJpdmVycy9ub3V2ZWF1L2NvZGVnZW4vbnY1
MF9pcl9wZWVwaG9sZS5jcHAKaW5kZXggMWVhMjc4Yi4uZmRlNTYxNiAxMDA2NDQKLS0tIGEvc3Jj
L2dhbGxpdW0vZHJpdmVycy9ub3V2ZWF1L2NvZGVnZW4vbnY1MF9pcl9wZWVwaG9sZS5jcHAKKysr
IGIvc3JjL2dhbGxpdW0vZHJpdmVycy9ub3V2ZWF1L2NvZGVnZW4vbnY1MF9pcl9wZWVwaG9sZS5j
cHAKQEAgLTUzNSw2ICs1MzUsNyBAQCBDb25zdGFudEZvbGRpbmc6OmV4cHIoSW5zdHJ1Y3Rpb24g
KmksCiAgICB9IGVsc2UgewogICAgICAgaS0+b3AgPSBPUF9NT1Y7CiAgICB9CisgICBpLT5zdWJP
cCA9IDA7CiB9CiAKIHZvaWQKLS0gCjEuOC41LjUKCg==
--001a11c20d02c9844104fc89678d
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--001a11c20d02c9844104fc89678d--
