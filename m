From: Karol Herbst <karolherbst-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 0/3] nv50/ir: Preapre for running Opts inside a
	loop
Date: Mon,  3 Apr 2017 17:58:19 +0200
Message-ID: <20170403155822.1810-1-karolherbst@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

U2xvd2x5IHdlIGFyZSBnZXR0aW5nIHRvIHRoZSBwb2ludCwgdGhhdCB3ZSBtaXNzIGVub3VnaCBv
cHRpbWl6YXRpb24Kb3Bwb3J0dW5pdGllcyBhcyB0aGUgcmVzdWx0IG9mIG91ciBvd24gcGFzc2Vz
LgoKRm9yIHRoaXMgd2UgbmVlZCB0byBmaXggQWxnZWJyYWljT3B0IHRvIGJlIGFibGUgdG8gaGFu
ZGxlIG1vZHMgb24gc291cmNlcwp3aXRob3V0IGNyZWF0aW5nIG5ldyBpc3N1ZXMuCgpUaGUgbGFz
dCBwYXRjaCBlbmFibGVzIGxvb3Bpbmcgb3B0cy4KCnYyOiB1cGRhdGUgY29tbWl0IGF1dGhvcgoK
S2Fyb2wgSGVyYnN0ICgzKToKICBudjUwL2lyOiBmaXggQWxnZWJyYWljT3B0IGZvciBzbGN0cyB3
aXRoIG1vZHMKICBudjUwL2lyOiBoYW5kbGUgbG9nb3BzIHdpdGggTk9UIGluIEFsZ2VicmFpY09w
dAogIG52NTAvaXI6IHJ1biBzb21lIHBhc3NlcyBtdWx0aXBsZSB0aW1lcwoKIC4uLi9kcml2ZXJz
L25vdXZlYXUvY29kZWdlbi9udjUwX2lyX3BlZXBob2xlLmNwcCAgIHwgMjkgKysrKysrKysrKysr
KysrLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDIwIGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25z
KC0pCgotLSAKMi4xMi4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK
